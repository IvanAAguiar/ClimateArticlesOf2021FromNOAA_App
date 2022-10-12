//
//  WordScrambleView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 11/10/2022.

import SwiftUI

struct WordScrambleView: View {
    
    @ObservedObject private var vm: WordViewModel = WordViewModel()
    @State private var playing = false
    
    var body: some View {
        ZStack {
            Image("scrabble")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.1)
            
            VStack {
                Text("Click on 'Start Game' and give us a guess!").font(.system(size: 40))
                    .padding()
            }
            .navigationTitle("Word Scramble Game")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(content: {
                    NavigationLink("Start Game", destination: ScrambleGameView(vm: vm))
                        .simultaneousGesture(TapGesture().onEnded(vm.startGame))
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
