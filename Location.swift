//
//  Location.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import CoreLocation
import Foundation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let exemple = Location(id: UUID(), name: "Buckingham", description: "Where Queen Elizabeth lived", latitude: 51.501, longitude: -0.141)
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
