//
//  InstaFilterAppView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 25/10/2022.
//

import SwiftUI

struct InstaFilterAppView: View {
    @StateObject private var vm = FilterViewModel()
    
    var body: some View {
        VStack {
            vm.image?
                .resizable()
                .scaledToFit()
                .padding()
            
            Button("SepiaTone") {
                vm.sepiaTone()
            }
            .buttonStyleModifier()
            Spacer()
        }
        .sheet(isPresented: $vm.showingImagePicker) {
            ImagePicker(vm: vm)
        }
        .onChange(of: vm.inputImage) { _ in vm.loadImage() }
        .navigationTitle("InstaFilter App")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button("Image") {
                vm.showingImagePicker = true
            }
        }
    }
}

struct InstaFilterAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InstaFilterAppView()
        }
    }
}
