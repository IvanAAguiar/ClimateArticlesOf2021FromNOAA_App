//
//  FirstPageView.swift
//  ClimateArticlesOf2021FromNOAA_App
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct FirstPageView: View {

    var articlesView: [Article] = articles.articles2021
    
    var body: some View {
        NavigationView {
            TabView {
                HomePageView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                ProjectListView()
                    .tabItem {
                        Image(systemName: "studentdesk")
                        Text("Projects")
                    }
                    .tag(1)
            }
            .accentColor(.black)
        }
    }
}

struct HomeProjectsPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}

