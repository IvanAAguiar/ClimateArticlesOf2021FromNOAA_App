//
//  WelcomeView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 30/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center, spacing: 10){
                    Spacer()
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                    Text("Welcome to my Project Library!")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                    Text("Please select the project from left-hand manu: swipe from the left edge to show it.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                
//                SeparatorComponent()
                Spacer()
                    .padding(.vertical, 30)
                
                    Text("This is the project number 1. It was inspired by HACKING WITH SWIFT. The principle goal is to undestand the basic structure of a SwiftUI app. It will tries to get form, navagation bar, program state, biding state, interface controls and loops as secoundary goals. All the data are static and was collected from NOAA web site.")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                }
            .padding()
        }
        }
//        .toolbar {
//            ToolbarItemGroup (placement: .navigationBarTrailing) {
//                NavigationLink(destination: ProjectListView()) {
//                    HStack{
//                        Text("Projects")
//                        Image(systemName: "studentdesk")
//                    }
//                }
//            }
//    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
