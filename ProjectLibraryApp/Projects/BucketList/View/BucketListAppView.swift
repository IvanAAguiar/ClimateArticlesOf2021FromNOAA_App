//
//  BucketListAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 27/10/2022.
//

import MapKit
import SwiftUI

struct BucketListAppView: View {
    @StateObject private var vm = ListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.users, id: \.id) { user in
                    NavigationLink  {
                        MapView(vm: vm, user: user)
                    } label: {
                        Text("\(user.lastName.uppercased()), \(user.firstName)")
                    }
                }
                .onDelete(perform: vm.removeUser)
            }
            Button("Add new user") {
                vm.showingAddUser = true
            }
            .buttonStyleModifier()
            .opacity(!vm.isUnlocked ? 0.4 : 1.0)
            .disabled(!vm.isUnlocked)
                
        }
        .sheet(isPresented: $vm.showingAddUser) {
            NewUserView(vm: vm)
        }
        .onAppear(perform: vm.authenticate)
        .navigationTitle("Bucket List")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct BucketListAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketListAppView()
        }
    }
}
