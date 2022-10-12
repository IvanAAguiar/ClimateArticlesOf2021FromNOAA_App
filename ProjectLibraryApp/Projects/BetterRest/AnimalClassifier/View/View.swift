////
////  AnimalClassifierView.swift
////  ProjectLibraryApp
////
////  Created by Ivan Aguiar on 07/10/2022.
////
//
//import CoreML
//import SwiftUI
//
//struct AnimalClassifierView: View {
//    
//    @ObservedObject var vm: ClassifierViewModel = ClassifierViewModel()
//    
//    var body: some View {
//        VStack {
//            Form {
//                Group {
//                    Picker("Hair", selection: $vm.hair) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Feathers", selection: $vm.feathers) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Eggs", selection: $vm.eggs) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Milk", selection: $vm.milk) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Airborne", selection: $vm.airborne) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Aquatic", selection: $vm.aquatic) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Predator", selection: $vm.predator) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Toothed", selection: $vm.toothed) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Backbone", selection: $vm.backbone) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Breathes", selection: $vm.breathes) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                }
//                Group {
//                    Picker("Venomous", selection: $vm.venomous) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Fins", selection: $vm.fins) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Legs", selection: $vm.legs) {
//                        ForEach([0,2,4,5,6,8], id: \.self) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Tail", selection: $vm.tail) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Domestic", selection: $vm.domestic) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                    Picker("Catsize", selection: $vm.catsize) {
//                        ForEach(0..<2) {
//                            Text(Int($0), format: .number)
//                        }
//                    }
//                }
//                .pickerStyle(.menu)
//            }
////            Button("Classify", action: vm.classify) {
////                
////            }
////            .ButtonCustomizedStyle()
////            .alert(isPresented: vm.showingResult) {
////                    let predicatedClass = vm.classify()!.class_type
////                    let predicatedAccurancy = vm.classify()!.class_typeProbability
////
////                    vm.resultVm.showResult(classType: Int(predicatedClass), probability: predicatedAccurancy[predicatedClass]!)
////                }
////                NavigationLink("Classify", destination: ResultView(name: vm.resultVm.alertTitle, probability: vm.resultVm.alertMessage))
////                .onTapGesture(perform: {
////                    let predicatedClass = vm.classify()!.class_type
////                    let predicatedAccurancy = vm.classify()!.class_typeProbability
////
////                    vm.resultVm.showResult(classType: Int(predicatedClass), probability: predicatedAccurancy[predicatedClass]!)
////                })
//                .ButtonCustomizedStyle()
//        }
//    }
//}
//
//struct AnimalClassifierView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalClassifierView()
//    }
//}
