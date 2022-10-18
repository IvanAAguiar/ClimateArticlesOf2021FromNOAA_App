//
//  FlowerShapeView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 18/10/2022.
//

import SwiftUI

struct FlowerShapeView: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var fillOn = false
    
    var body: some View {
        VStack {
            Toggle("Fill Red Color", isOn: $fillOn)
                .padding(20)
            
            if fillOn {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(.red, style: FillStyle(eoFill: true))
            } else {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .stroke(.red, lineWidth: 1)
            }
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
                .padding(.bottom, 40)
        }
    }
}

struct FlowerShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlowerShapeView()
        }
    }
}
