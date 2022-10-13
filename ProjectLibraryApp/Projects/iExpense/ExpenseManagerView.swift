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
            EditButton()
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
