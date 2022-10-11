//
//  WordScrambleView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 11/10/2022.
//

import SwiftUI

struct WordScrambleView: View {
    
    @ObservedObject private var vm: WordViewModel = WordViewModel()
    
    var body: some View {
        NavigationView {
        ZStack {
            LinearGradient(colors: [.green, .yellow], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea(.all)
            VStack {
                       List {
                           Section {
                               TextField("Enter your word", text: $vm.newWord)
                                   .textInputAutocapitalization(.none)
                           }
                           Section {
                               ForEach(vm.usedWords, id: \.self) {word in
                                   HStack {
                                       Image(systemName: "\(word.count).circle")
                                       Text(word)
                                   }
                               }
                           }
                       }
                   }
            }
        .navigationTitle(!vm.playing ? "Word Scramble Game" : vm.rootWord)
        .toolbar(content: {
            ToolbarItemGroup(content: {
                Button(!vm.playing ? "Start Game" : "Restart") {
                    vm.startGame()
                }
                if vm.playing {
                    Button("Finish", action: vm.finishGame)
                }
            })
        })
        .onSubmit(vm.addNewWord)
        .alert(vm.errorTitle, isPresented: $vm.showingError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(vm.errorMessage)
        }
        }
    }
}

struct WordScrambleView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleView()
    }
}
