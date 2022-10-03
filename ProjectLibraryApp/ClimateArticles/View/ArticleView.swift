//
//  ArticleView.swift
//  StormViewProject
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text(article.tittle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(article.publishedDate)
                    .font(.footnote)
                Image(article.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding()
                VStack (alignment: .leading, spacing: 10){
                    Text("DETAILS")
                        .font(.title)
                        .fontWeight(.medium)
                    Text(article.details)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                Link(destination: article.url) {
                    Text("FOR READ CLICK HERE!")
                        .bold()
                        .font(.title2)
                        .frame(width: 350, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                VStack (alignment: .leading, spacing: 10){
                    Text("Reference:")
                        .font(.title2)
                    Text(article.reference)
                }
                .padding()
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: articles.articles2021.first!)
    }
}
