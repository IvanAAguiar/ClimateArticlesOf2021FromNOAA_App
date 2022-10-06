//
//  BetterRestMLViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 06/10/2022.
//

import CoreML
import SwiftUI

class BetterRestMLViewModel: ObservableObject {
    
    @Published var wakeUp = defaultWakeTime
    @Published var sleepAmount: Double = 8.0
    @Published var coffeeAmount: Int = 1
    
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showingAlert = false

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
                alertTitle = "Error"
                alertMessage = "Sorry, there was a problem calculating your badtime."
            }
        showingAlert = true
    }
}
