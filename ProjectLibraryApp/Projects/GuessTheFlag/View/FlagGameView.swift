//
//  FlagGameView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct FlagGameView: View {
    
    @ObservedObject var vm: GuessViewModel = GuessViewModel()
            
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.5),
                .init(color: .white, location: 0.5)
            ],
                           center: .top,
                           startRadius: 70,
                           endRadius: 700)
            .ignoresSafeArea()
            VStack () {
                Spacer()
                VStack {
                    Text("Which is the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text("\(vm.countries[vm.correctAnswer].countryName.uppercased())")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                Spacer()
                
                ForEach(0..<3) { number in
                    Button {
                        vm.flagTapped(number)
                    } label: {
                        FlagView(countryName: vm.countries[number].countryName)
                    }
                }
                Spacer()
                Text("SCORE: \(vm.score)")
            }
            .alert(vm.scoreTitle, isPresented: $vm.showingScore) {
                Button("Continue", action: vm.askQuestion)
                if vm.gameOver {
                    Button("Finish", action: vm.resetGame)
                }
            } message: {
                vm.gameOver ? Text(vm.result()) : (vm.scoreTitle == "Correct" ? Text ("Well done!") : Text("Try again!"))
            }
        }
    }
}

struct FlagGameView_Previews: PreviewProvider {
    static var previews: some View {
        FlagGameView()
    }
}
