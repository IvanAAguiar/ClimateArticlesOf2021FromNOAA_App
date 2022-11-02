//
//  LocationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import SwiftUI

struct LocationView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: ListViewModel
    
    @State private var user: User
    @State private var name: String
    @State private var description: String

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section("Nearby...") {
                    let pages = vm.showPlaceInformations()
                    
                    ForEach(pages, id: \.pageid) { page in
                        Text(page.title)
                            .font(.headline)
                        + Text(": ")
                        + Text(page.description)
                            .italic()
                    }
                }
            }
            .navigationTitle("Place details")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.addLocation(to: user, name: name, description: description)
                        dismiss()
                    }
                }
                ToolbarItem (placement: .navigationBarLeading) {
                    Button ("Cancel") {
                        dismiss()
                    }
                }
            }
            .task {
                await vm.fetchNearbyPlaces()
            }
        }
    }

    init(vm: ListViewModel, user: User) {
        _vm = ObservedObject(initialValue:  vm)
        _user = State(initialValue: user)
        _name = State(initialValue: vm.selectedPlace?.name ?? "New Location")
        _description = State(initialValue: vm.selectedPlace?.description ?? "")
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(vm: ListViewModel(), user: User(firstName: "", lastName: ""))
        }
    }
}
