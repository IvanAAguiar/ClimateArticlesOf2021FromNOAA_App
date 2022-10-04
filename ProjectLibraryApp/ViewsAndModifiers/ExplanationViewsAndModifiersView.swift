//
//  ExplanationViewsAndModifiersView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct ExplanationViewsAndModifiersView: View {
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
                    Text("Views And Modifiers")
                        .font(.largeTitle)
                }
                Spacer()
                Text("This project was inspired from HACKING WITH SWIFT. The principle goal is to undestand the difference between TableView and TabView. All the data are static and was collected from NOAA web site.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Spacer()
            }
            .padding()
        }
    }
}

struct ExplanationViewsAndModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationViewsAndModifiersView()
    }
}
