//
//  DataController.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "ProjectLibrary")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
