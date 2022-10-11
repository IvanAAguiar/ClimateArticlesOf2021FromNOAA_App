//
//  WeSplitProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import Foundation
import SwiftUI

struct WeSplitProjectView: View {
    
    @ObservedObject private var vm: CalculatorViewModel = CalculatorViewModel()
    @FocusState private var billAmountIsFocused: Bool
    
    var body: some View {
            VStack {
                Form {
                    Section (header: Text("Amount to split")) {
                        TextField("Enter the amount", value: $vm.billAmount, format: .currency(code: vm.localCurreny))
                            .keyboardType(.decimalPad)
                            .focused($billAmountIsFocused)
                        Picker("Number of People", selection: $vm.numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section (header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $vm.tipPercentage) {
                            ForEach(vm.tipPercentages.percentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section (header: Text("IVA")) {
                        Toggle("To include IVA taxes", isOn: $vm.includeIVA)
                            .toggleStyle(.switch)
                        
                        if vm.includeIVA {
                            Picker("IVA taxes", selection: $vm.ivaPercentage) {
                                ForEach(vm.ivaPercentages.percentages, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Text(vm.iva.0, format: .currency(code: vm.localCurreny))
                            Link("About", destination: URL(string: vm.iva.1)!)
                                .modifier(URLLinkViewModifier())
                        }
                    }
                    
                    Section (header: Text("total per person")){
                        Text(vm.totalPerPerson, format: .currency(code: vm.localCurreny))
                            .foregroundColor(vm.tipPercentage == 0 ? .red : .primary)
                            .fontWeight(vm.tipPercentage == 0 ? .heavy : .medium)
                    }
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup (placement: .navigationBarTrailing) {
                    NavigationLink(destination: ExplanationView(title: "WeSplit", description: "This project was inspired from HACKING WITH SWIFT. The principle goal is to understand how Form works. The secondary goal is to customize the components and try to simplify the code as it is possible."), label: {
                        HStack {
                            Text("Explanation")
                            Image(systemName: "brain.head.profile")
                        }
                    })
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        billAmountIsFocused = false
                    }
                }
            }
    }
}

struct WeSplitProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeSplitProjectView()
        }
    }
}
