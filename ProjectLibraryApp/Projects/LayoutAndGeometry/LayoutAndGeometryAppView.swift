//
//  LayoutAndGeometryAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI


// MARK: Make views near the top of the scroll view fade out to 0 opacity – I would suggest starting at about 200 points from the top.

// MARK: Make views adjust their scale depending on their vertical position, with views near the bottom being large and views near the top being small. I would suggest going no smaller than 50% of the regular size.

// MARK: For a real challenge make the views change color as you scroll. For the best effect, you should create colors using the Color(hue:saturation:brightness:) initializer, feeding in varying values for the hue.

/* Each of those will require a little trial and error from you to find values that work well. Regardless, you should use max() to handle the scaling so that views don’t go smaller than half their size, and use min() with the hue so that hue values don’t go beyond 1.0.
 */

struct LayoutAndGeometryAppView: View {
    let color: [Color] = [.red, .pink, .purple, .cyan, .blue, .green, .mint, .orange, .yellow, .white, .brown, .indigo, .gray]
    
    var body: some View {
        TabView {
            FlippedCenterRotationView(colors: color)
                .tabItem {
                    Image(systemName: "1.circle")
                }
            CoverFlowView(colors: color)
                .tabItem {
                    Image(systemName: "2.circle")
                }
            RotatingBrushView(colors: color)
                .tabItem {
                    Image(systemName: "3.circle")
                }
            WindView(colors: color)
                .tabItem {
                    Image(systemName: "4.circle")
                }
            WaveView(colors: color)
                .tabItem {
                    Image(systemName: "5.circle")
                }
        }
        .padding()
        .shadow(radius: 10)
        .navigationTitle("Layout And Geometry")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct LayoutAndGeometryAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LayoutAndGeometryAppView()
        }
    }
}
