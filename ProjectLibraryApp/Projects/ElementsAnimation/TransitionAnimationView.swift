//
//  TransitionAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct TransitionAnimationView: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        HStack {
            ZStack {
                Text("Tap Me")
                    .clipShape(Rectangle())
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                    .background(Color.red)
                
                if isShowingRed {
                    Text("Now I'm blue")
                        .clipShape(Rectangle())
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .transition(.pivot)
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
        .draging()
    }
}

struct TransitionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionAnimationView()
    }
}
