//
//  User.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import Foundation

struct User: Identifiable, Comparable, Codable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName   < rhs.lastName
    }
    
    var id = UUID()
    let firstName: String
    let lastName: String
    var locations = [Location]()
}
