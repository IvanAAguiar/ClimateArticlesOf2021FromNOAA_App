//
//  GeometryReaderAnimationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct GeometryReaderAnimationView: View {
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk", "us"]
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                ForEach(countries, id: \.self) { flag in
                    GeometryReader { proxy in
                        FlagsCoordinateView(coordinateOnScreen: proxy.frame(in: .global).midY, flagName: flag)
                        .rotation3DEffect(
                            Angle(degrees: Double(proxy.frame(in: .global).minY) - 47), axis: (x: 0.0, y: 10.0, z: 7.0)
                            )
                    }
                    .frame(width: 370, height: 200)
                }
            }
            .padding(.trailing)
        }
        .padding(.horizontal)
    }
}

struct GeometryReaderAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderAnimationView()
    }
}
