//
//  FirstClimateArticlesView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 28/09/2022.
//

import SwiftUI

struct FirstClimateArticlesView: View {

    var articlesView: [Article] = articles.articles2021
    
    var body: some View {
        TabView {
            Articles_Table_View()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("TableView")
                }
                .tag(0)
            Articles_Tab_View()
                .tabItem {
                    Image(systemName: "arrow.right.doc.on.clipboard")
                    Text("TabView")
                }
                .tag(1)
            ExplanationView(title: "Climate Articles", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand the difference between TableView and TabView. All the data are static and was collected from NOAA web site.")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(2)
        }
    }
}

struct WeatherImagesView_Previews: PreviewProvider {
    static var previews: some View {
        FirstClimateArticlesView()
    }
}

