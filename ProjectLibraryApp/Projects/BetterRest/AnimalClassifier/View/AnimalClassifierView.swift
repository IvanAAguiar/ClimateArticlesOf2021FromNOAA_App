//
//  AnimalClassifierView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 10/10/2022.
//

import SwiftUI

struct AnimalClassifierView: View {
    
    @ObservedObject private(set) var vm: ResultViewModel = ResultViewModel()
    
    var body: some View {
        
        let name = vm.showResult().0
        let probability = vm.showResult().1
        
        NavigationView{
            ZStack {
                Color.yellow.ignoresSafeArea()
                VStack{
                    Text("Think in an animal...")
                        .font(.title2)
                    ScrollView {
                        ForEach(Array(vm.classifier.inputs), id: \.key) {item, value in
                            ClassifierQuestionView(inputName: item, vm: vm)
                        }
                    }
                    NavigationLink("Classify", destination: ResultView(name: name, probability: probability))
                        .buttonStyleModifier()
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
