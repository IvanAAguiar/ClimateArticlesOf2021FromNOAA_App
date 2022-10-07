//
//  FlagView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct FlagView: View {
    
    var countryName: String
    
    var body: some View {
        Image(countryName)
            .renderingMode(.original)
            .cornerRadius(5.0)
            .shadow(color: .black ,radius: 2.5)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(countryName: "uk")
    }
}
