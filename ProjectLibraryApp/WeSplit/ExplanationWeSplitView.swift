//
//  ExplanationWeSplitView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct ExplanationWeSplitView: View {
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
                    Text("WeSplit")
                        .font(.largeTitle)
                }
                Spacer()
                Text("This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how Form works. The secondary goal is to customize the components and try to simplify the code as it is possible.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Spacer()
            }
            .padding()
        }
    }
}

struct ExplanationWeSplitView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationWeSplitView()
    }
}
