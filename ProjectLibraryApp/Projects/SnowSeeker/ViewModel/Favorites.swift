//
//  Favorites.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/11/2022.
//

import Foundation

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    //the key we're using to read/write in UserDefaults
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("Favorites")
    
    // enum to sort the resorts
    enum sortedBy {
       case alphabetical, country
    }
    
    init () {
        // load our saved data
        do {
            let data = try Data(contentsOf: savePath)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            resorts = []
        }
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to out set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from out set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func sort(_ resorts: [Resort]) {

        }

}
