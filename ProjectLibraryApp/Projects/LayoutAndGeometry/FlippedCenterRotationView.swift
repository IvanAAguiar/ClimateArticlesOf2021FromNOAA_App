//
//  FlippedCenterRotationView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

struct FlippedCenterRotationView: View {
    let colors: [Color]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % colors.count])
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            })                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 6, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct FlippedCenterRotationView_Previews: PreviewProvider {
    static var previews: some View {
        FlippedCenterRotationView(colors: [.indigo, .brown, .mint, .red, .pink, .orange])
    }
}
