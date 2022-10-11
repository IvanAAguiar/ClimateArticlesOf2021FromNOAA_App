//
//  ListRowView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import SwiftUI

struct ListRowView: View {
    var article: Article
    
    var body: some View {
        HStack (spacing:10) {
            Image(article.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:80)
                .padding(.vertical, 4)
            Spacer()
            Text(article.tittle)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
        }
        .frame(height:80)
        .padding()
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(article: ArticleListViewModel().articles2021.first!)
    }
}
