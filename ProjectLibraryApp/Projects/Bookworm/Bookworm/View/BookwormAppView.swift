//
//  BookwormAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import SwiftUI

struct BookwormAppView: View {
    
    @StateObject var vm = BookwormViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.books, id: \.self) { book in
                    NavigationLink {
                        BookDetailView(vm: vm, book: book)
                    } label: {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack (alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: vm.deleteBooks)
            }
            
            Text("Counts: \(vm.books.count)")
        }
        .navigationTitle("Bookworm")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                EditButton()
                
                Button {
                    vm.showingAddScreen.toggle()
                } label: {
                    Label("Add Book", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $vm.showingAddScreen) {
            AddBookView(vm: vm)
        }
    }
}

struct BookwormAppViewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookwormAppView()
        }
    }
}
