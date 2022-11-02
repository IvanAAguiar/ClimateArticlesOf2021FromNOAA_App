//
//  HotProspectsAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 02/11/2022.
//

import SwiftUI

struct HotProspectsAppView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospects)
    }
}

struct HotProspectsAppView_Previews: PreviewProvider {
    static var previews: some View {
        HotProspectsAppView()
    }
}
