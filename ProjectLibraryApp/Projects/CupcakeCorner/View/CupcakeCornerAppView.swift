//
//  CupcakeCornerAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 19/10/2022.
//

import SwiftUI

struct CupcakeCornerAppView: View {
    
    @StateObject private var order: Order = Order()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
            }
            
            NavigationLink {
                AddressView(order: order)
            } label: {
                Text("Delivery details")
            }
            .buttonStyleModifier()
        }
        .navigationTitle("Capcake Corner")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CupcakeCornerAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CupcakeCornerAppView()
        }
    }
}
