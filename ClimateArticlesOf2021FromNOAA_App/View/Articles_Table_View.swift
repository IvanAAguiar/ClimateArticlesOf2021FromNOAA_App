//
//  Articles_Table_View.swift
//  StormViewProject
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import SwiftUI

struct Articles_Table_View: View {
    var articlesView: [Article] = articles.articles2021
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Explaining climate science, impacts, and adaptation through maps, graphs, and other data visualizations.")
                    List (articlesView, id: \.id) { item in
                        NavigationLink(destination: ArticleView(article: item), label: {
                            ListCellView(article: item)
                        })
                    }
                    .listStyle(.plain)
                    .navigationTitle("Articles from NOAA")
                }
            }
        }
    }
}

struct Articles_Table_View_Previews: PreviewProvider {
    static var previews: some View {
        Articles_Table_View()
    }
}
