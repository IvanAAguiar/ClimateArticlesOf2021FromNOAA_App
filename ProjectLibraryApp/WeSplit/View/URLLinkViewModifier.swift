//
//  URLLinkViewModifier.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import SwiftUI

struct URLLinkViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .fontWeight(.light)
    }
}
