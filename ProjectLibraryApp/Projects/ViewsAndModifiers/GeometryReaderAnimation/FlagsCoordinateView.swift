//
//  FlagsCoordinateView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct FlagsCoordinateView: View {
    
    var coordinateOnScreen: CGFloat
    var flagName: String
    
    var body: some View {
        VStack {
            Text("On screen position of \(coordinateOnScreen)")
//                .padding(4)
            ZStack {
                Image(flagName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370, height: 200)
                    .cornerRadius(35)
                Text(flagName.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10)
            }
        }
        .shadow(color: .gray, radius: 10, x:0, y:0)
        .padding(10)
    }
}

struct FlagsCoordinateView_Previews: PreviewProvider {
    static var previews: some View {
        FlagsCoordinateView(coordinateOnScreen: 47.000000, flagName: "uk")
    }
}
