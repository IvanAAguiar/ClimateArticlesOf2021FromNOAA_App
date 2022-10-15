//
//  CrewView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 15/10/2022.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image (crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay {
                                    Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                }
                            
                            VStack (alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static var previews: some View {
        CrewView(crew: [CrewMember(role: "Senior Pilot", astronaut: Astronaut(id: "white", name: "Edward H. White II", description: "Edward Higgins White II (November 14, 1930 – January 27, 1967) (Lt Col, USAF) was an American aeronautical engineer, U.S. Air Force officer, test pilot, and NASA astronaut. On June 3, 1965, he became the first American to walk in space. White died along with astronauts Virgil \"Gus\" Grissom and Roger B. Chaffee during prelaunch testing for the first crewed Apollo mission at Cape Canaveral.\n\nHe was awarded the NASA Distinguished Service Medal for his flight in Gemini 4 and was then awarded the Congressional Space Medal of Honor posthumously."))])
            .preferredColorScheme(.dark)
    }
}
