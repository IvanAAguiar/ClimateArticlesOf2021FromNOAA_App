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
                
                VStack {
                    Text("Hello, world!")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 200)
                .background(theme ? .ultraThickMaterial : .ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding()
        }
    }
}

struct ModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ViewsModifierView()
    }
}
