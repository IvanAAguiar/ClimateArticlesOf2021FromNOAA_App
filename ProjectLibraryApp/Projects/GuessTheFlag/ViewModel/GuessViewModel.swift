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
        Country(countryName: "Estonia", flagDescription: "Flag with three horizontal stripes of equal size. Top stribe blue, middle stripe black, bottom strip white", image: "estonia"),
        Country(countryName: "France", flagDescription: "Flag with three vertical stripes of equal size. Left stribe blue, middle stripe white, right strip red", image: "france"),
        Country(countryName: "Germany", flagDescription: "Flag with three horizontal stripes of equal size. Top stribe black, middle stripe red, bottom strip gold", image: "germany"),
        Country(countryName: "Ireland", flagDescription: "Flag with three vertical stripes of equal size. Left stribe green, middle stripe white, right strip orange", image: "ireland"),
        Country(countryName: "Italy", flagDescription: "Flag with three vertical stripes of equal size. Left stribe green, middle stripe white, right strip red", image: "italy"),
        Country(countryName: "Monaco", flagDescription: "Flag with two horizontal stripes of equal size. top stribe red, bottom strip white", image: "monaco"),
        Country(countryName: "Nigeria", flagDescription: "Flag with three vertical stripes of equal size. Left stribe green, middle stripe white, right strip green", image: "nigeria"),
        Country(countryName: "Poland", flagDescription: "Flag with two horizontal stripes of equal size. Top stribe white,  bottom strip red", image: "poland"),
        Country(countryName: "Russia", flagDescription: "Flag with three horizontal stripes of equal size. Top stribe white, middle stripe blue, bottom strip red", image: "russia"),
        Country(countryName: "UK", flagDescription: "Flag with everlapping red and white crosses, both straight and diagonally, on a blue background", image: "uk"),
        Country(countryName: "US", flagDescription: "Flag with red and white stripes of equal size, with qhite stars on a blue background in the top-left corner", image: "us")
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
