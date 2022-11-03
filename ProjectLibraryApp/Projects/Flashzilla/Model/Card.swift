//
//  Card.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/11/2022.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let exemple = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
