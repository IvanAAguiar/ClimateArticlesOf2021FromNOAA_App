//
//  Actor+CoreDataProperties.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//
//

import Foundation
import CoreData


extension Actor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Actor> {
        return NSFetchRequest<Actor>(entityName: "Actor")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Movie?

    public var wrappedName: String {
            name ?? "Unknown"
    }
}

extension Actor : Identifiable {

}
