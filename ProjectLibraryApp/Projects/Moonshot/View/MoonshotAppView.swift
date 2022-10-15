//
//  MoonshotAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 14/10/2022.
//

import SwiftUI

struct MoonshotAppView: View {
    
    @StateObject var vm: MissionViewModel = MissionViewModel()
    @State var tabView = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            if !tabView {
                VStack {
                    TabView {
                        ForEach(vm.missions, id: \.id) { mission in
                            MissionView(vm: vm, mission: mission)
                                .tabItem {
                                    Image(systemName:"\(mission.id).circle")
                                }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.missions, id: \.id) { mission in
                            NavigationLink {
                                MissionView(vm: vm, mission: mission)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.formatterLaunchDate)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
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
                    Toggle("List", isOn: $tabView)
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
