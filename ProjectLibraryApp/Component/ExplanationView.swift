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
                Spacer()
                HStack {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text(title)
                        .font(.largeTitle)
                }
                Spacer()
                
                VStack {
                    ScrollView {
                        Text(description)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                    }
                    
                }
                .frame(maxHeight: 400)
            }
            .padding()
        }
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView(title: "Something", description: "....................")
    }
}
