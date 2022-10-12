//
//  ScrambleGameView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 12/10/2022.
//

import SwiftUI

struct ScrambleGameView: View {
    
    @ObservedObject var vm: WordViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Enter your word", text: $vm.newWord)
                        .textInputAutocapitalization(.none)
                }
                Section ("My words") {
                    ForEach(vm.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            Text("Score: \(vm.score)")
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("The word is \(vm.rootWord)")
        .navigationBarTitleDisplayMode(.large)
        .onSubmit(vm.addNewWord)
        .toolbar(content: {
            ToolbarItemGroup(content: {
                Button("Restart", action: vm.startGame)
                Button("Finish", action: dismiss.callAsFunction)
            })
        })
        .alert(vm.errorTitle, isPresented: $vm.showingError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(vm.errorMessage)
        }
    }
}

struct ScrambleGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrambleGameView(vm: WordViewModel())
        }
    }
}
