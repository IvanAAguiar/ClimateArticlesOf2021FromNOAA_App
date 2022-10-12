//
//  DragAnimationModifier.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct DragAnimationModifier: ViewModifier {
    @State private var dragAmount = CGSize.zero

    func body(content: Content) -> some View {
        content
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded {_ in
                        dragAmount = .zero
                    }
            )
    }
}

extension View {
    func draging() -> some View {
        modifier(DragAnimationModifier())
    }
}
