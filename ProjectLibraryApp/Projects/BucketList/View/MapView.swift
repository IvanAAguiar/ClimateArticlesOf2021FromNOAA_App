//
//  MapView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    @ObservedObject var vm: ListViewModel
    var user: User
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion, annotationItems: user.locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text(location.name)
                            .font(.headline)
                    }
                    .onAppear() {
                        vm.selectedPlace = location
                    }
                }
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        vm.showingAddLocation = true
//                        vm.addLocation(to: user)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(isPresented: $vm.showingAddLocation) {
            LocationView(vm: vm, user: user)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(vm: ListViewModel(), user: User(firstName: "", lastName: ""))
    }
}
