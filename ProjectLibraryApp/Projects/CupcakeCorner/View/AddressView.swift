//
//  AddressView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 19/10/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    
    var body: some View {
        VStack {
            Form {
                Section ("Name") {
                    TextField("Max", text: $order.name)
                        .foregroundColor(order.isValidName() ? .primary : .red)
                }
                Section ("Street Address") {
                    TextField("12 Abbey College Rd", text: $order.streetAddress)
                        .foregroundColor(order.isValidStreetAddress() ? .primary : .red)
                }
                Section ("City") {
                    TextField("London", text: $order.city)
                        .foregroundColor(order.isValidCity() ? .primary : .red)
                }
                Section ("ZIP") {
                    TextField("1234-123", text: $order.zip)
                        .foregroundColor(order.isValidZip() ? .primary : .red)
                }
            }
            
            NavigationLink {
                CheckoutView(order: order)
            } label: {
                Text("Check out")
            }
            .buttonStyleModifier()
            .opacity(!order.isValidInput ? 0.4 : 1.0)
            .disabled(!order.isValidInput)
        }
        .navigationTitle("Delivery datails")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
