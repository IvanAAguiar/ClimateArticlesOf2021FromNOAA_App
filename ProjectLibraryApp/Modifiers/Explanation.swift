//
//  Explanation.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 19/10/2022.
//

import SwiftUI

struct Explanation: ViewModifier {
    let appTitle: String
    let description: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                NavigationLink(destination: ExplanationView(title: appTitle, description: description), label: {
                    HStack {
                        Text("Explanation")
                        Image(systemName: "brain.head.profile")
                    }
                })
            }
    }
}
