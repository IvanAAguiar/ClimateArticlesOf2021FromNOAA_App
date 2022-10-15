//
//  ExpenseManagerView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 13/10/2022.
//

import SwiftUI

struct ExpenseManagerView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        List {
            ForEach(expenses.items, id: \.id) { item in
                HStack {
                    VStack {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: "USD"))
                }
            }
            .onDelete(perform: removeItems)
        }
        .navigationTitle("iExpense")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button {
                showingAddExpense = true
            } label: {
                Image( systemName: "plus")
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            NavigationLink(destination: ExplanationView(title: "iExpense", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how UserDefaults, Codable, sheet(), onDelete(), @StateObject works. The secondary goal is get more experience with List, Text and code organization."), label: {
                HStack {
                    Text("Explanation")
                    Image(systemName: "brain.head.profile")
                }
            })
        }
    }
    
    func removeItems (at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}



struct ExpenseManagerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpenseManagerView()
        }
    }
}
