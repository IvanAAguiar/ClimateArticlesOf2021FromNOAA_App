//
//  FirstClimateArticlesPageView.swift
//  StormViewProject
//
//  Created by Ivan Aguiar on 28/09/2022.
//

import SwiftUI

struct FirstClimateArticlesPageView: View {

    var articlesView: [Article] = articles.articles2021
    
    var body: some View {
        TabView {
            ExplanationClimateArticlesView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(0)
            Articles_Table_View()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("TableView")
                }
                .tag(1)
            Articles_Tab_View()
                .tabItem {
                    Image(systemName: "arrow.right.doc.on.clipboard")
                    Text("TabView")
                }
                .tag(2)
        }
        .accentColor(.black)
    }
}

struct WeatherImagesView_Previews: PreviewProvider {
    static var previews: some View {
        FirstClimateArticlesPageView()
    }
}

