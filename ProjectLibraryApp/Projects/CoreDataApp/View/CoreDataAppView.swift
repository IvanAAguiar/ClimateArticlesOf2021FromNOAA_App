//
//  CoreDataAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//

import CoreData
import SwiftUI

struct CoreDataAppView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [], predicate: nil) var movies: FetchedResults<Movie>
    
    @State var title = ""
    @State var director = ""
    @State var year = 2022
    @State var filter = ""
    @State var filterValue = false
    @State var addActors = false
    
    var body: some View {
        VStack {
            Form {
                Section("New Movie") {
                    TextField("Title", text: $title)
                    TextField("Director", text: $director)
                    Picker("Year", selection: $year) {
                        ForEach(1890...2050, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Filter") {
                    Toggle("Filter by Director", isOn: $filterValue)
                    TextField("\(Image(systemName: "magnifyingglass"))", text: $filter)
                }
            }
            .formStyle(.grouped)
            .frame(maxHeight: 330)
            
            FilteredListView(filterKey: filter, filterValue: filterValue ? "director" : "title") {(movie: Movie) in
                
                NavigationLink(destination: MovieDetailsView(movie: movie)) {
                    MovieRowView(movie: movie)
                }
            }
            
            Button("Add Movie") {
                let newMovie = Movie(context: moc)
                newMovie.title = self.title
                newMovie.director = self.director
                newMovie.year = Int16(self.year)
                
                addActors = true
            }
            .sheet(isPresented: $addActors, content: {
                AddActorsView(title: self.title, director: self.director, year: self.year)
            })
            .buttonStyleModifier()
        }
        .navigationTitle("Movie App")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup {
                Button("Save") {
                    if moc.hasChanges {
                        try? moc.save()
                    }
                }
            }
        }
    }
}

struct Person: Hashable {
    let name: String
}

struct CoreDataAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoreDataAppView()
        }
    }
}
