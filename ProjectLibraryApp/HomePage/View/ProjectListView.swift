//
//  ProjectListView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
//        let projects: [Int: Project] = Bundle.main.decode("projects.json")

            List {
                Group {
                    NavigationLink("WeSplit", destination: WeSplitProjectView())
                    NavigationLink("Climate Articles", destination: ClimateArticlesView())
                    NavigationLink("Guess The Flag", destination: GuessTheFlagView())
                    NavigationLink("Views And Modifiers", destination: ViewsModifierView())
                    NavigationLink("BetterRest", destination: BetterRestView())
                    NavigationLink("Word Scramble", destination: WordScrambleView())
                    NavigationLink("Animation", destination: AnimationProjectView())
                    NavigationLink("iExpense", destination: ExpenseManagerView())
                    NavigationLink("Moonshot", destination: MoonshotAppView()
                        .modifier(Explanation(appTitle: "Moonshot", description: "This project was inspired by HACKING WITH SWIFT. The principle goal is to understand how Codable works. The secondary goal is get more experience with List, Text and code organisation.")))
                    NavigationLink("Drawing App", destination: DrawingAppView())
                }
                Group {
                    NavigationLink("Cupcake Corner", destination: CupcakeCornerAppView())
                    NavigationLink("Bookworm", destination: BookwormAppView())
                    NavigationLink("Students", destination: StudentsAppView())
                    NavigationLink("CoreData App", destination: CoreDataAppView())
                    NavigationLink("InstaFilter", destination: InstaFilterAppView())
                    NavigationLink("Bucket List", destination: BucketListAppView())
                    NavigationLink("VoiceOver", destination: VoiceOverAppView())
                    NavigationLink("Hot Prospects", destination: HotProspectsAppView())
                }
            }
            .navigationTitle("Projects")
            .navigationBarTitleDisplayMode(.large)
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectListView()
        }
    }
}
