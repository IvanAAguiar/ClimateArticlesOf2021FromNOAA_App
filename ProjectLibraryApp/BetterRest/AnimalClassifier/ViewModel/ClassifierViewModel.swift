//
//  ClassifierViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import CoreML
import SwiftUI

class ClassifierViewModel: ObservableObject {
    
    @Published var inputs = [
        "hair" : 0.0,
        "feathers" : 0.0,
        "eggs" : 0.0,
        "milk" : 0.0,
        "airborne" : 0.0,
        "aquatic" : 0.0,
        "predator" : 0.0,
        "toothed" : 0.0,
        "backbone" : 0.0,
        "breathes" : 0.0,
        "venomous" : 0.0,
        "fins" : 0.0,
        "legs" : 0.0,
        "tail" :0.0,
        "domestic" : 0.0,
        "catsize" : 0.0
    ]
        
    func classify() -> AnimalClassifierOutput? {
        do {
            let config = MLModelConfiguration()
            let model = try AnimalClassifier(configuration: config)

            let prediction = try model.prediction(hair: inputs["hair"]!, feathers: inputs["feathers"]!, eggs: inputs["eggs"]!, milk: inputs["milk"]!, airborne: inputs["airborne"]!, aquatic: inputs["aquatic"]!, predator: inputs["predator"]!, toothed: inputs["toothed"]!, backbone: inputs["backbone"]!, breathes: inputs["breathes"]!, venomous: inputs["venomous"]!, fins: inputs["fins"]!, legs: inputs["legs"]!, tail: inputs["tail"]!, domestic: inputs["domestic"]!, catsize: inputs["catsize"]!)
            
            return prediction
        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem to classify."
        }
        return nil
    }
}
