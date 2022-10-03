//
//  Articles_Tab_View.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import SwiftUI

struct Articles_Tab_View: View {

    var articlesView: [Article] = articles.articles2021
    
    var body: some View {
        TabView {
            ForEach (articlesView, id: \.id) { art in
                ArticleView(article: art)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.cyan.opacity(0.3))
    }
}

struct Articles_Tab_View_Previews: PreviewProvider {
    static var previews: some View {
        Articles_Tab_View()
    }
}
