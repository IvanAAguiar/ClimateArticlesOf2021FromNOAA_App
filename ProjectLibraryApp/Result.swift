//
//  Result.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
