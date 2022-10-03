//
//  HomePageView.swift
//  ClimateArticlesOf2021FromNOAA_App
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            Color(.orange).ignoresSafeArea()
            VStack (alignment: .center, spacing: 10){
                Spacer()
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                Text("My First Project")
                    .font(.largeTitle)
                Spacer()
                Text("This is the project number 1. It was inspired from HACKING WITH SWIFT. The principle goal is to undestand the basic structure of a SwiftUI app. It will tries to get form, navagation bar, program state, biding state, interface controls and loops as secoundary goals. All the data are static and was collected from NOAA web site.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
            }
            .padding()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
