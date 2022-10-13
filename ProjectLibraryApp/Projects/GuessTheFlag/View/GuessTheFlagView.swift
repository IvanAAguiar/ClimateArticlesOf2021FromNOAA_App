//
//  GuessTheFlagView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct GuessTheFlagView: View {
    
    @ObservedObject private var vm: GuessViewModel = GuessViewModel()
        
    var body: some View {
        VStack {
            Image("flag_world")
                .resizable()
                .scaledToFit()
            NavigationLink("Start") {
                FlagGameView()
            }
            .buttonStyleModifier()
            .font(.system(size: 40))
            .padding(.vertical, 60)
        }
        .padding(80)
        .navigationTitle("Guess The Flag")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup (placement: .navigationBarTrailing) {
                NavigationLink(destination: ExplanationView(title: "Guess The Flag", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand new SwiftUI functionality: stacks, buttons, images, alerts, asset catalogs, and more. The secondary goal is turn the components reusables.")) {
                    HStack {
                        Image(systemName: "brain.head.profile")
                        Text("Explanation")
                    }
                }
            }
        }
    }
}

struct GuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessTheFlagView()
        }
    }
}
