//
//  FirstWeSplitView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct FirstWeSplitView: View {
    var body: some View {
        TabView {
            WeSplitProjectView()
                .tabItem {
                    Image(systemName: "plusminus")
                    Text("WeSplit")
                }
                .tag(0)
            ExplanationView(title: "WeSplit", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how Form works. The secondary goal is to customize the components and try to simplify the code as it is possible.")
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Explanation")
                }
                .tag(1)
        }
    }
}

struct FirstWeSplitPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstWeSplitView()
    }
}
