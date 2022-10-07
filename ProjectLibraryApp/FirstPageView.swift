//
//  FirstPageView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct FirstPageView: View {
    
    @Environment(\.colorScheme) var defaultColor
    
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
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
        }
        .accentColor(defaultColor == .light ? .black : .white)
    }
}

struct HomeProjectsPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}

