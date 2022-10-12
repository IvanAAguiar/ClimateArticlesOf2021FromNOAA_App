//
//  AnimationProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct AnimationProjectView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .green], startPoint: .zero, endPoint: .bottom)
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                CornerAnimationView()
                SnakAnimationView()
                TransitionAnimationView()
            }
            .navigationTitle("Elements Animation")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup (placement: .navigationBarTrailing) {
                    NavigationLink(destination: ExplanationView(title: "Elements Animation", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how Animation works. The secondary goal is to customize the components and try to simplify the code as it is possible."), label: {
                        HStack {
                            Text("Explanation")
                            Image(systemName: "brain.head.profile")
                        }
                    })
                }
            }
        }
    }
}

struct AnimationProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationProjectView()
        }
    }
}
