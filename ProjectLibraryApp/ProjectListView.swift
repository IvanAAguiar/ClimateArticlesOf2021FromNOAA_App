//
//  ProjectListView.swift
//  ClimateArticlesOf2021FromNOAA_App
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        Form {
            NavigationLink("WeSplit", destination: FirstWeSplitPageView())
            NavigationLink("Climate Articles", destination: FirstClimateArticlesPageView())
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
