//
//  ExplanationGuessTheFlagView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct ExplanationGuessTheFlagView: View {
    var body: some View {
        ZStack {
            Color(.orange).ignoresSafeArea()
            VStack (alignment: .center, spacing: 10) {
                Spacer()
                HStack {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Guess The Flag")
                        .font(.largeTitle)
                }
                Spacer()
                Text("")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Spacer()
            }
            .padding()
        }
    }
}

struct ExplanationGuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationGuessTheFlagView()
    }
}
