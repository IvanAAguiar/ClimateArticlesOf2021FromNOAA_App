//
//  LayoutAndGeometryAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/11/2022.
//

import SwiftUI

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
