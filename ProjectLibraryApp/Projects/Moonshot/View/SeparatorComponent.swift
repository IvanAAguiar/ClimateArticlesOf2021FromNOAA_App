//
//  SeparatorComponent.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 15/10/2022.
//

import SwiftUI

struct SeparatorComponent: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct SeparatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorComponent()
    }
}
