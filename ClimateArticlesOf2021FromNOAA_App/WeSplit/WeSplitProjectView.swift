//
//  WeSplitProjectView.swift
//  ClimateArticlesOf2021FromNOAA_App
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import Foundation
import SwiftUI

struct WeSplitProjectView: View {
    
//    @FocusState private var focusedInput: Field?
    
    @State private var billAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    
    @FocusState private var billAmountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = billAmount / 100 * tipSelection
        let grandTotal = billAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Enter the amount", value: $billAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($billAmountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }  header: {
                    Text("WeSplit")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .textCase(.none)
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                            
                        }
                        .pickerStyle(.segmented)
                    }
                } header: {
               Text("How much tip do you want to leave?")
           }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
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
        }
        .background(.mint.opacity(0.4))
    }
}

struct WeSplitProjectView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitProjectView()
    }
}
