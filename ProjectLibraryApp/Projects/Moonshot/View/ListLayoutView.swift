//
//  ListLayoutView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 16/10/2022.
//

import SwiftUI

struct ListLayoutView: View {
    
    @ObservedObject var vm: MissionViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.missions, id: \.id) { mission in
                    NavigationLink {
                        MissionView(vm: vm, mission: mission)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                            .frame(width: 100, height: 100)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formatterLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                    }
                }
                .listStyle(.plain)
                .listRowBackground(Color.darkBackground)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListLayoutView(vm: MissionViewModel())
        }
    }
}
