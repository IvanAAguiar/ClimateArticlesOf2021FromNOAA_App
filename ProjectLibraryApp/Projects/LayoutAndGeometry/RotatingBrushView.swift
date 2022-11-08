//
//  RotatingBrushView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

struct RotatingBrushView: View {
    let colors: [Color]

    var body: some View {
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
                            })                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY / 0.1) / 1, axis: (x: 0, y: 1, z: 0.1))
                    }
                    .frame(height: 40)
            }
        }
    }
}

struct RotatingBrushView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingBrushView(colors: [.indigo, .brown, .mint, .red, .pink, .orange])
    }
}
