//
//  ExpenseItem.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 13/10/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // ID must be unchenged, but, once you try to give a value and that already exist, it will change to be unique
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
