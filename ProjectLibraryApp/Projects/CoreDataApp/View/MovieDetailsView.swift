//
//  MovieDetailsView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) private var dismiss
    let movie: Movie
    
    
    var body: some View {
        VStack {
            Image(systemName: "play.rectangle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 200, maxHeight: 150)
                .padding()
            
            Form {
                Section ("Director") {
                    Text(movie.wrappedDirector)
                }
                
                Section ("Year") {
                    Text(String(movie.year))
                }
                
                Section("Actors") {
                    ForEach(movie.actorArray, id: \.self) { act in
                        Text(act.wrappedName)
                    }
                }
            }
        }
        .navigationTitle(movie.wrappedTitle)
        .navigationBarTitleDisplayMode(.large)
//        .alert("Delete book?", isPresented: $vm.showingDeleteAlert) {
//            Button("Delete", role: .destructive) {
//                vm.deleteBook(book)
//                dismiss()
//            }
//            .foregroundColor(.red)
//
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Are you sure?")
//        }
    }
}
