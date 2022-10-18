//
//  DrawingAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 17/10/2022.
//

import SwiftUI

struct DrawingAppView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown, .red], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                TabView {
                    SpirographView()
                    BlendingColorsView()
                    FlowerShapeView()
                    ColorCyclingView()
                    AnimatablePairView()
                }
                .tabViewStyle(.page)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black, radius: 10)
            .padding()
            .navigationTitle("Drawing App")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(content: {
                    NavigationLink(destination: ExplanationView(title: "Drawing App", description: "This project was inspired by HACKING WITH SWIFT. The principle goal learn about paths, shapes, strokes, transforms, drawing groups, animating values, and more. The secondary goal is get more experience with List, TabView and code organization."), label: {
                        HStack {
                            Text("Explanation")
                            Image(systemName: "brain.head.profile")
                        }
                    })
                })
            }
        }
    }
}

struct DrawingAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DrawingAppView()
        }
    }
}
