//
//  ViewsModifierView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 05/10/2022.
//

import SwiftUI

struct ViewsModifierView: View {
    
    @State private var theme: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.blue, .yellow], center: .topLeading, startRadius: 10.0, endRadius: 750.0).ignoresSafeArea()
            VStack {
                Toggle("Choose the theme", isOn: $theme)
                if theme {
                    GridMaginificationEffectView()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                } else {
                    GeometryReaderAnimationView()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
            }
            .padding()
        }
        .navigationTitle("View Modifiers")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink(destination: ExplanationView(title: "Views And Modifiers", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how GeometryReader and LazyVGrid work. The second goal is review @State, customized itens, random itens, arrays and ForEachs.")) {
                    HStack {
                        Text("Explanation")
                        Image(systemName: "brain.head.profile")
                    }
                }
            }
        }
    }
}

struct ModifierView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewsModifierView()
        }
    }
}
