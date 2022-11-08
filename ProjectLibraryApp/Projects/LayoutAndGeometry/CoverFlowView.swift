//
//  CoverFlowView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

struct CoverFlowView: View {
    let colors: [Color]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        VStack (alignment: .center) {
                            Text("Number \(num)")
                                .font(.largeTitle)
                        }
                        .frame(width: 200, height: 400)
                        .background(colors[num % colors.count])
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        })
                        .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 7, axis: (x: 0, y: 1, z: 0))
                        .offset(x: 115)
                    }
                    .offset(y:50)
                    .frame(width: 200, height: 500)
                    .padding(15)
                }
            }
        }
    }
}

struct CoverFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CoverFlowView(colors: [.indigo, .brown, .mint, .red, .pink, .orange])
    }
}
