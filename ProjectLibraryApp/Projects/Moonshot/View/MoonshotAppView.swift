//
//  MoonshotAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 14/10/2022.
//

import SwiftUI

struct MoonshotAppView: View {
    
    @StateObject var vm: MissionViewModel = MissionViewModel()
    @State var showingList = false
    
    
    
    var body: some View {
        VStack {
            if showingList {
                ListLayoutView(vm: vm)
            } else {
                GridLayoutView(vm: vm)
            }
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(content: {
                Toggle("List", isOn: $showingList)
                    .padding(.horizontal)
            })
        }
    }
}

struct MoonshotAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoonshotAppView()
        }
    }
}
