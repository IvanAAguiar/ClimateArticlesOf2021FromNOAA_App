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
    @Published var showingAlert = false

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var calculateBedTime: String {
        let config = MLModelConfiguration()
        let model = try? SleepCalculator(configuration: config)
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        let prediction = try? model!.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
        
        let sleepTime = (wakeUp - prediction!.actualSleep)
        
        return "Your ideal bedtime is \(sleepTime.formatted(date: .omitted, time: .shortened))."
    }
}
