//
//  ResultView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import SwiftUI

struct ResultView: View {
    
    let name: String
    let probability: String
    
    var body: some View {
        VStack {
            Text(name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(name)
                .resizable()
                .scaledToFit()
            Text("It has a probability of \(probability) to be \(name)!")
                .font(.title3)
                .fontWeight(.heavy)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(name: "mammal", probability: String(0.0341029123912))
    }
}
