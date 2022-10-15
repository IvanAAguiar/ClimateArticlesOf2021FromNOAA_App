//
//  MissionViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 15/10/2022.
//

import Foundation
import SwiftUI

class MissionViewModel: ObservableObject {
    
    @Published var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    @Published var missions: [Mission] = Bundle.main.decode("missions.json")
        
    func getCrewMembers (misson: Mission) -> [CrewMember] {
        let crew = misson.crew.map({ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        })
        return crew
    }
}
