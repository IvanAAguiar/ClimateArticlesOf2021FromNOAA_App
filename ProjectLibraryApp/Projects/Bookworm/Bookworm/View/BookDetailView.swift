//
//  BookDetailView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import SwiftUI

struct BookDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: BookwormViewModel
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()

                Text(book.genre ?? "Fantasy")
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Rectangle())
                    .offset(x: -5, y: -5)
            }
            VStack {
                Text(book.author ?? "Unknown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(vm.formatterDate(book.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(book.review ?? "No Review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.large)
        .alert("Delete book?", isPresented: $vm.showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                vm.deleteBook(book)
                dismiss()
            }
            .foregroundColor(.red)
            
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                vm.showingDeleteAlert = true
            } label: {
                Label("Delete thie book", systemImage: "trash")
            }
        }
    }
}
