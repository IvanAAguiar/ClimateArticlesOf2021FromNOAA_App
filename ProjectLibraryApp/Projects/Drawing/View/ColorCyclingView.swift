//
//  ColorCyclingView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 18/10/2022.
//

import SwiftUI

struct ColorCyclingView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
                .padding()
        }
    }
}

struct ColorCyclingView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingView()
    }
}
