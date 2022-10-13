//
//  BetterRestView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 06/10/2022.
//

import CoreML
import SwiftUI

struct BetterRestView: View {
    
    @ObservedObject var vm: BetterRestMLViewModel = BetterRestMLViewModel()
    
    var body: some View {
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
                Section {}
                Section {}
                VStack {
                    Text(vm.calculateBedTime)
                        .font(.system(size: 23))
                        .fontWeight(.heavy)
                }
            }
            .font(.headline)
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ExplanationView(title: "Better Rest", description: """
                    This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how MLCreate works
                    The reason we have a fairly simple project is because is to introduce one of the true power features of iOS development: machine learning (ML).
                    All iPhones come with a technology called Core ML built right in, which allows us to write code that makes predictions about new data based on previous data it has seen. We’ll start with some raw data, give that to our Mac as training data, then use the results to build an app able to make accurate estimates about new data – all on device, and with complete privacy for users.
                    The actual app we’re building is called BetterRest, and it’s designed to help coffee drinkers get a good night’s sleep by asking them three questions:
                    - When do they want to wake up?
                    - Roughly how many hours of sleep do they want?
                    - How many cups of coffee do they drink per day?
                    Once we have those three values, we’ll feed them into Core ML to get a result telling us when they ought to go to bed. If you think about it, there are billions of possible answers – all the various wake times multiplied by all the number of sleep hours, multiplied again by the full range of coffee amounts.
                    That’s where machine learning comes in: using a technique called regression analysis we can ask the computer to come up with an algorithm able to represent all our data. This in turn allows it to apply the algorithm to fresh data it hasn’t seen before, and get accurate results.
                    """)) {
                        HStack {
                            Text("Explanation")
                            Image(systemName: "brain.head.profile")
                        }
                    }
                }
            
            }
            NavigationLink(destination: AnimalClassifierView()) {
                Text("Jump to another game")
            }
            .buttonStyleModifier()
        }
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BetterRestView()
        }
    }
}
