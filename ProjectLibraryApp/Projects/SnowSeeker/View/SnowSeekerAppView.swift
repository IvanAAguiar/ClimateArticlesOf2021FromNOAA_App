//
//  SnowSeekerAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 07/11/2022.
//

import SwiftUI

struct SnowSeekerAppView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    private var pickerSortTitle = ["Alphabetical", "Country", "None"]
    @State private var sortTitle: String = "None"
    
    var body: some View {
        VStack {
            Picker("Sort by:", selection: $sortTitle) {
                ForEach(pickerSortTitle, id: \.self) { title in
                    Text(title)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                        .environmentObject(favorites)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack (alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search for a resort")
        }
    }
    
    var sortedResorts: [Resort] {
        switch sortTitle {
        case "Alphabetical":
            return resorts.sorted(by: {$0.name < $1.name})
        case "Country":
            return resorts.sorted(by: {$0.country < $1.country})
        default:
            return resorts
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct SnowSeekerAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SnowSeekerAppView()
        }
    }
}
