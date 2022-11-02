//
//  FlagGameView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/10/2022.
//

import SwiftUI

struct FlagGameView: View {
    
    @ObservedObject var vm: GuessViewModel
    @Environment(\.dismiss) private var dismiss
            
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
                .accessibilityElement(children: .combine)
                Spacer()
                
                ForEach(0..<3) { number in
                    FlagView(country: vm.countries[number])
                        .rotation360()
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded({_ in
                                    vm.flagTapped(number)
                                })
                        )
                }
                Spacer()
                Text("SCORE: \(vm.score)")
            }
            .alert(vm.scoreTitle, isPresented: $vm.showingScore) {
                if !vm.gameOver { Button("Continue", action: vm.askQuestion) } else {
                    Button("Restart", action: vm.askQuestion)
                }
            } message: {
                vm.gameOver ? Text(vm.result()) : (vm.scoreTitle == "Correct" ? Text ("Well done!") : Text("Try again!"))
            }
        }
        .navigationTitle("Do you have 8 chances!")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup {
                Button("Finish", action: dismiss.callAsFunction)
                    .simultaneousGesture(TapGesture().onEnded(vm.resetGame))
            }
        }
    }
}

struct FlagGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlagGameView(vm: GuessViewModel())
        }
    }
}
