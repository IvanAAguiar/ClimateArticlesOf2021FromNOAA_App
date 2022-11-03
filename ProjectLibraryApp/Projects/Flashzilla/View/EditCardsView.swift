//
//  EditCardsView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 03/11/2022.
//

import SwiftUI

struct EditCardsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack (spacing: 10) {
                        TextField("Prompt", text: $newPrompt)
                            .border(.black.opacity(0.4))
                        TextField("Answer", text: $newAnswer)
                        // MARK: Must be done a component to TextField
                            .border(.black.opacity(0.4))
                    }
                    .textFieldStyle(.roundedBorder)
                    
                    .padding(20)
                    
                    Button("Add new card") {
                        addCard()
                    }
                    .buttonStyleModifier()
                }
                
                SeparatorComponent()
                
                List {
                    ForEach (0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCard)
                }
            }
            .navigationTitle("New Card")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                        Button("Done", action: done)
                    }
            }
        .listStyle(.grouped)
        .onAppear(perform: loadData)
    }
    
    func done() {
        dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
        cleanFields()
    }
    
    func removeCard(at offsets: IndexSet) -> Void {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    func cleanFields() {
        self.newAnswer = ""
        self.newPrompt = ""
    }
}


struct EditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardsView()
    }
}
