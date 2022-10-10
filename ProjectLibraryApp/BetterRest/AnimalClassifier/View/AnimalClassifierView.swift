//
//  AnimalClassifierView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 10/10/2022.
//

import SwiftUI

struct AnimalClassifierView: View {
    
    @ObservedObject var vm: ResultViewModel = ResultViewModel()
    
    private var inputs = [
        "hair", "feathers", "eggs", "milk", "airborne", "aquatic", "predator", "toothed", "backbone", "breathes", "venomous", "fins", "legs", "tail", "domestic", "catsize"
    ]
    
    var body: some View {
        
        let name = vm.showResult().0
        let probability = vm.showResult().1
        
        NavigationView{
            ZStack {
                Color.yellow.ignoresSafeArea()
                VStack{
                    Text("Think in an animal...")
                        .font(.title2)
                    List {
                        ForEach(inputs, id: \.self) {item in
                            ClassifierQuestionView(inputName: item, vm: vm)
                        }
                    }
                    NavigationLink("Classify", destination: ResultView(name: name, probability: probability))
                        .ButtonCustomizedStyle()
                }
                .navigationTitle("Animal Classifier")
            }
        }
    }
}

struct AnimalClassifierView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalClassifierView()
    }
}
