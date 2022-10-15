//
//  MissionView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 15/10/2022.
//

import SwiftUI

struct MissionView: View {
    
    @ObservedObject var vm: MissionViewModel
    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formatterLaunchDate)
                        .font(.title2)
                    
                    VStack (alignment: .leading){
                        SeparatorComponent()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        SeparatorComponent()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewView(crew: vm.getCrewMembers(misson: mission))
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionView(vm: MissionViewModel(), mission: MissionViewModel().missions[0])
                .preferredColorScheme(.dark)
        }
    }
}
