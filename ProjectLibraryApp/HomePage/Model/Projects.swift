//
//  ProjectModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 19/10/2022.
//

import Foundation

struct Project: Codable, Identifiable {
    let id: Int
    let projTitle: String
    let projDescription: String
}
