//
//  FlagView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 04/10/2022.
//

import SwiftUI

struct FlagView: View {
    
    var country: Country
    
    var body: some View {
        Image(country.image)
            .renderingMode(.original)
            .cornerRadius(5.0)
            .shadow(color: .black ,radius: 2.5)
            .accessibilityLabel("\(country.flagDescription)")
            .accessibilityRemoveTraits(.isImage)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(country: Country(countryName: "US", flagDescription: "new test", image: "us"))
    }
}
