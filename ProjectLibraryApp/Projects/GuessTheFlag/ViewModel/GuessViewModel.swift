//
//  GuessViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import SwiftUI

class GuessViewModel: ObservableObject {
    
    @Published var showingScore = false
    @Published var gameOver = false
    @Published var scoreTitle: String = ""
    @Published var score = 0
    @Published var plays = 0
    
    let POINT = 10

    @Published var correctAnswer = Int.random(in: 0...2)
    @Published var countries = [
        FlagModel(countryName: "estonia"),
        FlagModel(countryName: "france"),
        FlagModel(countryName: "germany"),
        FlagModel(countryName: "ireland"),
        FlagModel(countryName: "italy"),
        FlagModel(countryName: "monaco"),
        FlagModel(countryName: "nigeria"),
        FlagModel(countryName: "poland"),
        FlagModel(countryName: "russia"),
        FlagModel(countryName: "uk"),
        FlagModel(countryName: "us")
    ].shuffled()

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            addPoint()
            scoreTitle = "Correct"
        } else {
            removePoint()
            scoreTitle = "Wrong"
        }
        
        showingScore = true
        plays += 1
        
        if plays == 8 {
            gameOver = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        if gameOver {
            resetGame()
        }
    }
    
    func addPoint() {
       score += POINT
    }
    
    func removePoint() {
        if score != 0 {
            score -= POINT
        }
    }
    
    func result() -> String {
        if score < 40 {
            return "You lost! Do you need to improve"
        } else if score > 60 {
           return "You won! Very good job!"
        } else {
           return "You won! Congratulation!!"
        }
    }
    
    func resetGame() {
            plays = 0
            score = 0
            gameOver = false
    }
}
