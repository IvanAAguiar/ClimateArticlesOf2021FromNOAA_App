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
                NavigationLink(destination: ExplanationView(title: "Moonshot", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how Codable works. The secondary goal is get more experience with List, Text and code organization."), label: {
                    HStack {
                        Text("Explanation")
                        Image(systemName: "brain.head.profile")
                    }
                })
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
