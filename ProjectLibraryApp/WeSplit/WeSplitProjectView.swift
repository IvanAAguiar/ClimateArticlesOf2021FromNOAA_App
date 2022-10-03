//
//  WeSplitProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import Foundation
import SwiftUI

struct WeSplitProjectView: View {
        
    @State private var billAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    @State private var ivaPercentage = 23
    @State private var includeIVA = false
    
    @FocusState private var billAmountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    let ivaPercentages = [23, 13, 6]
    
    var iva: Double {
        let ivaSelection = Double(ivaPercentage)
        
        let ivaAmount = billAmount / 100 * ivaSelection
                
        return ivaAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = billAmount / 100 * tipSelection
        let grandTotal: Double
        
        if includeIVA {
            grandTotal = billAmount + tipValue + iva
        } else {
            grandTotal = billAmount + tipValue
        }
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    let currencyFormatter = {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section (header: Text("Amount to split")) {
                        TextField("Enter the amount", value: $billAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                            .keyboardType(.decimalPad)
                            .focused($billAmountIsFocused)
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section (header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                
                    Section (header: Text("IVA")) {
                        Toggle("To include IVA taxes", isOn: $includeIVA)
                            .toggleStyle(.switch)
                                                
                         if includeIVA {
                            Picker("IVA taxes", selection: $ivaPercentage) {
                                ForEach(ivaPercentages, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(.segmented)
                            Text(iva, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                            Link("About", destination: URL(string: "https://www.e-konomista.pt/como-calcular-o-iva")!)
                         }
                    }
                    
                    Section (header: Text("total per person")){
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    }
                }
            }
            .formStyle(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        billAmountIsFocused = false
                    }
                }
            }
            .navigationTitle("WeSplit")
            .tint(.blue)
        }
    }
}

struct WeSplitProjectView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitProjectView()
    }
}
