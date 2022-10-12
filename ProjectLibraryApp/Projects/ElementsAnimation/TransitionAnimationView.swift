//
//  TransitionAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct TransitionAnimationView: View {
    
    @State private var isShowingRed = false
    @State private var dragAmount3 = CGSize.zero
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                Text("Tap at me")
                    .foregroundColor(.white)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                    Text("Tap at me")
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
        }
        .frame(width: 200, height: 200)
        .cornerRadius(10)
        .shadow(radius: 10)
        .offset(dragAmount3)
        .gesture(
            DragGesture()
                .onChanged { dragAmount3 = $0.translation }
                .onEnded {_ in
                    dragAmount3 = .zero
                }
        )
    }
}

struct TransitionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionAnimationView()
    }
}
