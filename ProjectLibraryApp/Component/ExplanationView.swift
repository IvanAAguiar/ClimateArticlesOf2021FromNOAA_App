//
//  ExplanationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct ExplanationView: View {
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            Color(.clear).ignoresSafeArea()
            VStack (alignment: .center, spacing: 10) {
                VStack {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text(title)
                        .font(.largeTitle)
                }
                .padding(50)
                VStack {
                    ScrollView {
                        Text(description)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                    }
                    
                }
                .frame(maxHeight: 400)
                .padding(10)
            }
            Spacer()
        }
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView(title: "Something", description: "....................")
    }
}
