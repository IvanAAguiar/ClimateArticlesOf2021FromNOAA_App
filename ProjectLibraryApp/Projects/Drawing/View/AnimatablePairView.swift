//
//  AnimatablePairView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 18/10/2022.
//

import SwiftUI

struct AnimatablePairView: View {
    @State private var rows = 2
    @State private var columns = 2
    
    var body: some View {
        VStack {
            Text("Tap to multiply and long press to come back!")
                .font(.title.bold())
                .padding(5)
            
            CheckerBoard(rows: rows, columns: columns)
                .onTapGesture {
                    withAnimation(.linear(duration: 3)) {
                        rows = self.rows * 2
                        columns = self.columns * 2
                    }
                }
                .onLongPressGesture {
                    withAnimation(.linear(duration: 3)) {
                        rows = 2
                        columns = 2
                    }
                }
        }
    }
}

struct AnimatablePairView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairView()
    }
}
