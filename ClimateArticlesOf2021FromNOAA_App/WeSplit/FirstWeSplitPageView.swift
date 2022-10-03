//
//  FirstWeSplitPageView.swift
//  ClimateArticlesOf2021FromNOAA_App
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct FirstWeSplitPageView: View {
    var body: some View {
        TabView {
            ExplanationWeSplitView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(0)
            WeSplitProjectView()
                .tabItem {
                    Image(systemName: "plusminus")
                    Text("WeSplit")
                }
                .tag(1)
        }
    }
}

struct FirstWeSplitPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstWeSplitPageView()
    }
}
