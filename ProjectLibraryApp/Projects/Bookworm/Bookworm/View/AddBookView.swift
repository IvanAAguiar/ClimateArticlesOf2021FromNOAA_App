//
//  AddBookView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: BookwormViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Name of book", text: $vm.title)
                        .foregroundColor(vm.isValidTitle() ? .primary : .red)
                    TextField("Author's name", text: $vm.author)
                        .foregroundColor(vm.isValidAuthor() ? .primary : .red)
                    
                    Picker("Genre", selection: $vm.genre) {
                        ForEach (vm.genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    DatePicker("Date", selection: $vm.date, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
                
                Section ("Write a review") {
                    TextEditor(text: $vm.review)
                }
                
                Section ("Rate the book") {
                    RatingView(rating: $vm.rating)

                }
            }
            
            Button("Save") {
                vm.addBook()
                dismiss()
            }
            .buttonStyleModifier()
            .opacity(!vm.isValidInput ? 0.4 : 1.0)
            .disabled(!vm.isValidInput)
        }
        .navigationTitle("Add Book")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddBookView(vm: BookwormViewModel())
        }
    }
}
