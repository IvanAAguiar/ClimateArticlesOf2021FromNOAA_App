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
    let localCurreny = Locale.current.currency?.identifier ?? "EUR"
    
    var iva: (Double, String) {
        let url = "https://www.e-konomista.pt/como-calcular-o-iva"
        let ivaAmount = billAmount / 100 * Double(ivaPercentage)
                
        return (ivaAmount, url)
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipValue = billAmount / 100 * Double(tipPercentage)
        
        let grandTotal: Double = includeIVA ? (billAmount + tipValue + iva.0) : (billAmount + tipValue)
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section (header: Text("Amount to split")) {
                        TextField("Enter the amount", value: $billAmount, format: .currency(code: localCurreny))
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
                             Text(iva.0, format: .currency(code: localCurreny))
                             Link("About", destination: URL(string: iva.1)!)
                                 .modifier(UrlLink())
                         }
                    }
                    
                    Section (header: Text("total per person")){
                        Text(totalPerPerson, format: .currency(code: localCurreny))
                            .foregroundColor(tipPercentage == 0 ? .red : .primary)
                            .fontWeight(tipPercentage == 0 ? .heavy : .medium)
                    }
                }
            }
            .formStyle(.grouped)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        billAmountIsFocused = false
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct UrlLink: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .fontWeight(.light)
    }
}

struct WeSplitProjectView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitProjectView()
    }
}
