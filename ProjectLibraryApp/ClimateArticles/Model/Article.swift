//
//  Article.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import Foundation

struct Article: Identifiable {
    let id = UUID()
    let tittle: String
    let details: String
    let reference: String
    let url: URL
    let imageName: String
    let publishedDate: String
}
