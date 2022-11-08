//
//  WindView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

struct WindView: View {
    let colors: [Color]

    var body: some View {
            ScrollView (){
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: 250)
                            .background(colors[index % colors.count])
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black, lineWidth: 1)
                            })                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY) , axis: (x: 0.99, y: 0.58, z: 0.7))
                    }
                    .frame(height: 200)
            }
                .offset(x: 70)
        }
    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(colors: [.indigo, .brown, .mint, .red, .pink, .orange])
    }
}
