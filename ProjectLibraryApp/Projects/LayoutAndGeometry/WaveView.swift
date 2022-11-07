//
//  WaveView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

struct WaveView: View {
    let colors: [Color]

    var body: some View {
            ScrollView (){
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % colors.count])
                            .shadow(radius: 1)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY), axis: (x: 1, y: 0, z: 0.2))
                    }
                    .padding()
            }
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView(colors: [.indigo, .brown, .mint, .red, .pink, .orange])
    }
}
