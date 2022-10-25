//
//  Movie+CoreDataProperties.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var year: Int16
    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var actor: NSSet?

}

// MARK: Generated accessors for actor
extension Movie {

    @objc(addActorObject:)
    @NSManaged public func addToActor(_ value: Actor)

    @objc(removeActorObject:)
    @NSManaged public func removeFromActor(_ value: Actor)

    @objc(addActor:)
    @NSManaged public func addToActor(_ values: NSSet)

    @objc(removeActor:)
    @NSManaged public func removeFromActor(_ values: NSSet)

    public var wrappedTitle: String {
        title ?? "Unknown"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown"
    }
    
    public var actorArray: [Actor] {
        let set = actor as? Set<Actor> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

extension Movie : Identifiable {

}
