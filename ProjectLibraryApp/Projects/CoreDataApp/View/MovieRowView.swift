//
//  MovieRowView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Image(systemName: "play.tv")
            
            Text(movie.wrappedTitle)
                .font(.title)
            Spacer()

            VStack {
                
                Text(movie.wrappedDirector)
                    .font(.caption)
                Text("\(movie.year)")
                    .font(.caption)
            }
        }
    }
}
