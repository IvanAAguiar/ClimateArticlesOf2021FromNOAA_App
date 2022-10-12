//
//  CalculatorViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var billAmount = 0.0
    @Published var numberOfPeople = 1
    @Published var tipPercentage = 0
    @Published var ivaPercentage = 23
    @Published var includeIVA = false
        
    var tipPercentages = TipModel(percentages: [0, 5, 10, 15, 20, 25])
    var ivaPercentages = IVAModel(percentages: [23, 13, 6])
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
    
    func addPercentageOfIVA(newPercentage: Int) {
        ivaPercentages.percentages.append(newPercentage)
    }
    
    func removePercentageOfIVA(indexOf: Int) {
        ivaPercentages.percentages.remove(at: indexOf)
    }
    
    func addPercentageOfTip(newPercentage: Int) {
        tipPercentages.percentages.append(newPercentage)
    }
    
    func removePercentageOfTip(indexOf: Int) {
        tipPercentages.percentages.remove(at: indexOf)
    }
}
