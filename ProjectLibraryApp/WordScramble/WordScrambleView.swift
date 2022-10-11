//
//  WordScrambleView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 11/10/2022.
//

import SwiftUI

struct WordScrambleView: View {
    
    @ObservedObject private var vm: WordService = WordService()
    
    var body: some View {
        NavigationView {
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
            .navigationTitle(vm.rootWord)
            .onSubmit(vm.addNewWord)
            .onAppear(perform: vm.startGame)
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
