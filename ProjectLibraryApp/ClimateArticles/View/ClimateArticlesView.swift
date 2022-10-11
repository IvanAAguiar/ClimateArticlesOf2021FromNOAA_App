//
//  ClimateArticlesView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 28/09/2022.
//

import SwiftUI

struct ClimateArticlesView: View {
    
    var body: some View {
            ZStack {
                Color.clear.ignoresSafeArea()
                VStack {
                    VStack (spacing: 50) {
                        Text("Choose how would you like to see the information")
                            .font(.system(size: 38))
                            .multilineTextAlignment(.center)
                        Image(systemName: "cloud.sun.bolt")
                            .resizable()
                            .scaledToFit()
                            .padding(50)
                        HStack {
                            NavigationLink(destination: Articles_Table_View()) {
                                HStack {
                                    Image(systemName: "list.dash")
                                    Text("TableView")
                                }
                            }
                            .ButtonCustomizedStyle()
                            NavigationLink(destination: Articles_Tab_View()) {
                                HStack {
                                    Image(systemName: "arrow.right.doc.on.clipboard")
                                    Text("TabView")
                                }
                            }
                            .ButtonCustomizedStyle()
                        }
                        .padding(20)
                    }
                    .navigationTitle("Clamate Articles")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ExplanationView(title: "Climate Articles", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand the difference between TableView and TabView. All the data are static and was collected from NOAA web site.")) {
                                HStack {
                                    Text("Explanation")
                                    Image(systemName: "brain.head.profile")
                                }
                            }
                        }
                    }
                }
            }
    }
}

struct ClimateArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClimateArticlesView()
        }
    }
}

