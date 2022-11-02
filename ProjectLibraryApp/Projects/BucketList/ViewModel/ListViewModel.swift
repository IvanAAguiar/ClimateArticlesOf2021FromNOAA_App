//
//  ListViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import Foundation
import LocalAuthentication
import MapKit

@MainActor class ListViewModel: ObservableObject {
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @Published private(set) var users: [User]
    
    @Published var selectedUser: User?
    @Published var selectedPlace: Location?
    
    @Published var showingAddUser = false
    @Published var showingAddLocation = false
    @Published var onChange = false
    @Published var isUnlocked = false
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    enum LoadingState {
        case loading, loaded, failed
    }
    @Published var loadingState = LoadingState.loading
    @Published var pages = [Page]()
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            users = []
        }
    }
    
    //MARK: Functions to manipulate Locations from Users
    func save() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addUser(_ firstName: String, _ lastName: String) {
        let newUser = User(firstName: firstName, lastName: lastName)
        users.append(newUser)
        save()
    }
    
    func addLocation(to user: User, name: String, description: String) {
        selectedPlace?.name = name
        selectedPlace?.description = description
        
        guard let newLocation = selectedPlace else {return}
        
        if let index = users.firstIndex(of: user) {
            users[index].locations.append(newLocation)
        }
        save()
    }
    
    func updateLocation(_ location: Location, for user: User) {
        guard let selectedPlace = selectedPlace else { return }

        if let index = users.firstIndex(of: user) {
            if let index = users[index].locations.firstIndex(of: selectedPlace) {
                users[index].locations[index] = location
            }
        }
        save()
    }
    
    func removeUser (at offsets: IndexSet) -> Void {
        users.remove(atOffsets: offsets)
    }
    
    // MARK: Functions to handle the near information by places
    func fetchNearbyPlaces() async {
        guard let location = selectedPlace else { return }
        
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // we got some data back!
            let items = try JSONDecoder().decode(BucketListResult.self, from: data)
            // success - convert the array values to our pages array
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch let error {
            // if we're still here it means the request failed somehow
            loadingState = .failed
            print(error.localizedDescription)
        }
    }
    
    func showPlaceInformations() -> [Page] {
        switch loadingState {
        case .loading:
            print("Loading...")
        case .failed:
            print("Please try again later.")
        default:
            print("Already loaded.")
        }
        return pages
    }
    
    //MARK: Functions to handle the authentication feature
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    Task { @MainActor in
                        self.isUnlocked = true
                    }
                } else {
                    //  there was a problem
                }
            }
        } else {
            // no biomatrics
        }
    }
}
