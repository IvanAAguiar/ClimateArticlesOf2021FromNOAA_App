//
//  AddActorsView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//

import CoreData
import SwiftUI

struct AddActorsView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) private var dismiss
    
    @State private var actor = ""
    
    let title: String
    let director: String
    let year: Int
            
    var body: some View {
        let movie = Movie(context: moc)

        NavigationView {
            VStack {
                HStack {
                    TextField("New actor", text: $actor)
                        .padding()
                    Button("Add") {
                        let actor = Actor(context: moc)
                        actor.name = self.actor
                        movie.title = self.title
                        movie.director = self.director
                        movie.year = Int16(self.year)
                        actor.origin = movie
                        try? moc.fetch(NSFetchRequest<Book>(entityName: "Actor"))
                        Task{
                            self.actor = ""
                        }
                    }
                }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightBackground)
                    .padding(.vertical)
                
                List {
                    ForEach(movie.actorArray, id: \.self) {
                        Text($0.wrappedName)
                    }
                }
            }
            .foregroundColor(.primary)
            .navigationTitle("Add actors...")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem {
                    Button("Done") {
                        try? moc.save()
                        dismiss()
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}

