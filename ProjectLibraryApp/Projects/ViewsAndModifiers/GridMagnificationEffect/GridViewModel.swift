//
//  GridViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/10/2022.
//

import SwiftUI

class GridViewModel: ObservableObject {

    //Colors to the effect
    @Published var colorsTapped = Gradient(colors: [.cyan, .mint, .green, .yellow, .orange, .red, .pink, .purple, .teal])
    @Published var colorsNotTapped = Gradient(colors: [.white, .gray, .black, .gray, .white])
    
    //MARK: Calculating Scale For Each Item With the Help Of Pythagorean Theorem
    func itemScale(rect: CGRect, size: CGSize, coord: CGPoint) -> CGFloat {
        let x = coord.x - rect.midX
        let y = coord.y - rect.midY
        
        let root = sqrt((x * x) + (y * y))
        let diagonalValue = sqrt((size.width * size.width) + (size.height * size.height))
        
        //MARK: For More Detail Divide Diagonal Valeu
        let scale = root / (diagonalValue / 3)
        let modifiedScale = coord == .zero ? 1 : (1 - scale)
        return modifiedScale > 0 ? modifiedScale : 0.001
    }
}
