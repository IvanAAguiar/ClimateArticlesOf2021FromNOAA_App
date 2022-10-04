//
//  GridMaginificationEffectView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct GridMaginificationEffectView: View {
    // MARK: Gesture State
    @GestureState var location: CGPoint = .zero
    
    //Colors to the effect
    let colorsTapped = Gradient(colors: [.cyan, .mint, .green, .yellow, .orange, .red, .pink, .purple, .teal])
    let colorsNotTapped = Gradient(colors: [.white, .gray, .black, .gray, .white])
        
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            /*
             MARK: To Fit Into Whole View
             calculating Item Count with the help of Heidht & Width
             In a Row We Have 10 Items
             */
            let width = (size.width / 10)
            //Multiplaying Each Row Count
            let itemCount = Int((size.height / width).rounded()) * 10
            
            
            //MARK: For Solid Linear Gradient
            //We're Going to Uss Mask
            AngularGradient(gradient: location == .zero ? colorsNotTapped: colorsTapped, center: .center).mask {
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 10), spacing: 0) {
                    ForEach(0..<itemCount, id: \.self) {_ in
                        
                        GeometryReader { innerProxy in
                            let rect = innerProxy.frame(in: .named("GESTURE"))
                            let scale = itemScale(rect: rect, size: size)
                            
                            //MARK: Instead Of Manual Calculation
                            //We're going to use UIKit's CGAffineTransform
                            let transformedRect = rect.applying(.init(scaleX: scale, y: scale))
                            //MARK: Transformin Location Too
                            let transformedLocation = location.applying(.init(scaleX: scale, y: scale))
                            
                            RoundedRectangle(cornerRadius: 4)
                                .scaleEffect(scale)
                            
                                //MARK: For Effect 1
                                // We Need to Re-Locate Every Item To Currently Draaging Position
                                .offset(x: (transformedRect.midX - rect.midX), y: (transformedRect.midY - rect.midY))
                                .offset(x: location.x - transformedLocation.x, y: location.y - transformedLocation.y)
                        }
                        .padding(5)
                        .frame(height: width)
                    }
                }
            }
        }
        .padding(15)
        .gesture(
            DragGesture(minimumDistance: 0)
                .updating($location, body: { value, out, _ in
                    out = value.location
                })
        )
        .coordinateSpace(name: "GESTURE")
        .animation(.easeOut, value: location == .zero)
    }
    
    //MARK: Calculating Scale For Each Item With the Help Of Pythagorean Theorem
    func itemScale(rect: CGRect, size: CGSize) -> CGFloat {
        let x = location.x - rect.midX
        let y = location.y - rect.midY
        
        let root = sqrt((x * x) + (y * y))
        let diagonalValue = sqrt((size.width * size.width) + (size.height * size.height))
        
        //MARK: For More Detail Divide Diagonal Valeu
        let scale = root / (diagonalValue / 3)
        let modifiedScale = location == .zero ? 1 : (1 - scale)
        return modifiedScale > 0 ? modifiedScale : 0.001
    }
}

struct ViewsAndModifiersProjectView_Previews: PreviewProvider {
    static var previews: some View {
        GridMaginificationEffectView()
    }
}
