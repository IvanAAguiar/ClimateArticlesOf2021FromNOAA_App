//
//  VoiceOverAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 28/10/2022.
//

import SwiftUI

struct VoiceOverAppView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    @State private var selectedPicture = Int.random(in: 0...3)
    @State private var value = 10
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    var body: some View {
        VStack {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedPicture = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
            
            VStack {
                Text("It is:")
                Text("Second view")
                    .font(.caption)
            }
            .accessibilityElement(children: .combine)
            
            Image(decorative: "lion")
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)
            
            VStack{
                Text("Value: \(value)")
                    .font(.title)
                
                Button("Increment") {
                    value += 1
                }
                .buttonStyleModifier()

                Button("Decrement") {
                    value -= 1
                }
                .buttonStyleModifier()
            }
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Mot handled")
                }
            }
        }
    }
}

struct VoiceOverAppView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceOverAppView()
    }
}
