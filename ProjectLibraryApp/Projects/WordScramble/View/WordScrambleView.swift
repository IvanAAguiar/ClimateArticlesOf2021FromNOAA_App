//
//  WordScrambleView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 11/10/2022.

import SwiftUI

struct WordScrambleView: View {
    
    @StateObject private var vm: WordViewModel = WordViewModel()
    
    var body: some View {
        ZStack {
            Image("scrabble")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.1)
            
            VStack {
                Text("Click on 'Start Game' and give us a guess!").font(.system(size: 40))
                    .padding()
                NavigationLink("Start Game", destination: ScrambleGameView(vm: vm))
                    .simultaneousGesture(TapGesture().onEnded(vm.startGame))
                    .buttonStyleModifier()
            }
            .navigationTitle("Word Scramble Game")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(content: {
                    NavigationLink(destination: ExplanationView(title: "Word Scramble Game", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how List View, onAppear, Bundle, fatalError(), and UITextChecker works. The secondary goal is to use navigationView to organize the path for the views."), label: {
                        HStack {
                            Text("Explanation")
                            Image(systemName: "brain.head.profile")
                        }
                    })
                })
            })
        }
    }
}

struct WordScrambleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WordScrambleView()
        }
    }
}
