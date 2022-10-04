//
//  GuessTheFlagProjectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct GuessTheFlagProjectView: View {
    
    @State var showingScore = false
    @State var scoreTitle: String = ""
    @State var score = 0
    @State var plays = 0
    
    let point = 10

    @State var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk", "us"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .white, location: 0.3)
            ],
                           center: .top,
                           startRadius: 70,
                           endRadius: 700)
            .ignoresSafeArea()
            VStack (spacing: 30) {
                Spacer()
                VStack {
                    Text("Which is the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text("\(countries[correctAnswer].uppercased())")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                Spacer()
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        FlagView(countryName: countries[number])
                    }
                }
                Spacer()
                Text("SCORE: \(score)")
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            if plays == 8 {
                Button("Finish", action: finish)
                    .foregroundColor(Color.red)
            }
        } message: {
            if plays == 8 { Text(result()) }
            scoreTitle == "Correct" ? Text ("Well done!") : Text("Try again!")
        }
    }
    
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
            scoreTitle = "Game Over"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func addPoint() {
       score += point
    }
    
    func removePoint() {
        if score != 0 {
            score -= point
        }
    }
    
    func finish() {
        score = 0
        plays = 0
    }
    
    func result() -> String {
        plays = 0
        
        if score < 40 {
            return "You lost! Do you need to improve"
        } else if score > 60 {
           return "You won! Very good job!"
        } else {
           return "You won! Congratulation!!"
        }
    }
}

struct GuessTheFlagProjectView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagProjectView()
    }
}
