//
//  BookwormViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import CoreData
import Foundation
import SwiftUI

class BookwormViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var books: [Book] = []
    
    @Published var showingAddScreen = false
    @Published var showingDeleteAlert = false
    
    @Published var title = ""
    @Published var author = ""
    @Published var rating = 0
    @Published var genre = ""
    @Published var review = ""
    @Published var date = Date.now
        
    @Published var genres = ["","Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isValidInput: Bool {
        if !isValidTitle() ||
        !isValidAuthor() ||
        !isValidGenre() ||
        !isValidDate() ||
        !isValidRate(){
            return false
        }
        return true
    }
    
    init() {
        container = NSPersistentContainer(name: "ProjectLibrary")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error.localizedDescription)")
            } else {
                print("SUCCESSFULLY LOADED CORE DATA!")
            }
        }
        fetchBooks()
    }
    
    func formatterDate(_ date: Date?) -> String {
        let dateFormatted = date?.formatted(date: .long, time: .omitted) ?? "Unknown Date"
        return dateFormatted
    }
    
    // MARK: Storage Functions
    
    func fetchBooks() {
        let request = NSFetchRequest<Book>(entityName: "Book")
        do {
            books = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func saveBook() {
        do {
            try container.viewContext.save()
            fetchBooks()
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
    
    func addBook() {
        let newBook = Book(context: container.viewContext)
        newBook.title = self.title
        newBook.author = self.author
            newBook.id = UUID()
            newBook.rating = Int16(self.rating)
            newBook.genre = self.genre
            newBook.review = self.review
            newBook.date = self.date
            saveBook()
            resetInputs()
            fetchBooks()
    }
    
    func resetInputs() {
       title = ""
       author = ""
       rating = 0
       genre = ""
       review = ""
       date = Date.now
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            container.viewContext.delete(book)
        }
        saveBook()
    }
    
    
    func deleteBook(_ book: Book) {
        container.viewContext.delete(book)
        saveBook()
    }
    
    // MARK: Validation Functions
    func isValidTitle() -> Bool {
        do {
            let titlePattern = #"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*$"#
            let titleTest = try NSRegularExpression(pattern: titlePattern)
            let range = NSRange(location: 0, length: title.count)
            if titleTest.firstMatch(in: title, range: range) != nil{
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func isValidAuthor() -> Bool {
        do {
            let authorPattern = #"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*$"#
            let authorTest = try NSRegularExpression(pattern: authorPattern)
            let range = NSRange(location: 0, length: author.count)
            if authorTest.firstMatch(in: author, range: range) != nil || author.count >= 3 {
                return true
            } else {
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func isValidGenre() -> Bool {
        if genre == "" {
            return false
        }
        return true
    }
    
    func isValidDate() -> Bool {
        if date.formatted(date: .abbreviated, time: .omitted) == Date.now.formatted(date: .abbreviated, time: .omitted) ||
            date > Date.now {
            return false
        }
        return true
    }
    
    func isValidRate() -> Bool {
        if rating == 0 {
            return false
        }
        return true
    }
}
