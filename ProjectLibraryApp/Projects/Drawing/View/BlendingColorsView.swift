//
//  BlendingColorsView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 18/10/2022.
//

import SwiftUI

struct BlendingColorsView: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(.red))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(.green))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(.blue))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()    }
}

struct BlendingColorsView_Previews: PreviewProvider {
    static var previews: some View {
        BlendingColorsView()
    }
}
