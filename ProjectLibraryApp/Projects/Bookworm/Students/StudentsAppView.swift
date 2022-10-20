//
//  StudentsAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 20/10/2022.
//

import SwiftUI

struct StudentsAppView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add Student") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Granger", "Lovegood", "Potter", "Weasley", "Winner"]
                
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
            .buttonStyleModifier()
        }
    }
}

struct BookwormAppView_Previews: PreviewProvider {
    static var previews: some View {
        StudentsAppView()
    }
}
