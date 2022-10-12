//
//  SnakAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct SnakAnimationView: View {
    
    let letters = Array("Move me...")
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id:\.self) { num in
                Text(String(letters[num]))
                    .padding(3)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 30), value: dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded {_ in
                                dragAmount = .zero
                            }
                    )
            }
        }
        .padding(.horizontal, 10)
    }
}

struct SnakAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SnakAnimationView()
    }
}
