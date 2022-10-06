//
//  BetterRestProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 06/10/2022.
//

import CoreML
import SwiftUI

struct BetterRestProjectView: View {
    
    @ObservedObject var vm: BetterRestMLViewModel = BetterRestMLViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("When do you want to wake up?") {
                        DatePicker("Hour and minutes", selection: $vm.wakeUp, displayedComponents: .hourAndMinute)
                    }
                    Section("Desired amount of sleep") {
                        Stepper("\(vm.sleepAmount.formatted()) hours", value: $vm.sleepAmount, in: 4...12, step: 0.25)
                    }
                    Section("Daily coffee intake") {
                        Picker("Daily coffee intake", selection: $vm.coffeeAmount) {
                            ForEach (0...25, id: \.self) { coffee in
                                Text(coffee, format: .number)
                            }
                        }
                    }
                }
                .font(.headline)
                .navigationTitle("BetterRest")
                
                Button("Calculate", action: vm.calculateBedTime)
                    .ButtonCustomizedStyle()
                    .alert(vm.alertTitle, isPresented: $vm.showingAlert) {
                        Button("Ok") {
                            
                        }
                    } message: {
                        Text(vm.alertMessage)
                    }
            }
        }
    }
}

struct BetterRestProject_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestProjectView()
    }
}
