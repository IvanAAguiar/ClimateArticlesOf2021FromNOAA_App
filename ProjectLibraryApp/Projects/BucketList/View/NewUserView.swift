//
//  NewUserView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 28/10/2022.
//

import SwiftUI

struct NewUserView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: ListViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $firstName)
                    TextField("Description", text: $lastName)
                }
            }
            .navigationTitle("New User")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.addUser(firstName, lastName)
                        dismiss()
                    }
                }
                ToolbarItem (placement: .navigationBarLeading) {
                    Button ("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView(vm: ListViewModel())
    }
}
