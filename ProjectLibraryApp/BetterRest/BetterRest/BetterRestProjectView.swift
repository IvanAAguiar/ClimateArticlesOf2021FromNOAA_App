//
//  BetterRestProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 06/10/2022.
//

import CoreML
import SwiftUI

struct BetterRestProjectView: View {
    
//    @State private var wakeUp = defaultWakeTime
//    @State private var sleepAmount: Double = 8.0
//    @State private var coffeeAmount: Int = 1
//    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
//
//    static var defaultWakeTime: Date {
//        var components = DateComponents()
//        components.hour = 7
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? Date.now
//    }
    
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
    
//    func calculateBedTime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//
//            let sleepTime = wakeUp - prediction.actualSleep
//            alertTitle = "Your ideal bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//        } catch {
//                alertTitle = "Error"
//                alertMessage = "Sorry, there was a problem calculating your badtime."
//            }
//        showingAlert = true
//    }
}

struct BetterRestProject_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestProjectView()
    }
}
