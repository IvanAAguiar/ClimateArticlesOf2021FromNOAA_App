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
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                if vm.image == nil {
                    Text("Tap to select a picture")
                        .foregroundColor(.primary.opacity(0.7))
                        .font(.headline)
                } else {
                    vm.image?
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding(.horizontal)
            .onTapGesture {
                vm.showingImagePicker = true
            }
            
            HStack (alignment: .center) {
                Text("Filter Intensity")
                Slider(value: $vm.intensity)
                    .onChange(of: vm.intensity) { _ in
                        vm.loadImage()
                        if vm.image != nil {
                            vm.disableButton = true
                        }
                    }
            }
            .padding()
            
            HStack (spacing: 4) {
                Button("Filter") {
                    vm.showingConfirmation = true
                }
                .confirmationDialog("Filter", isPresented: $vm.showingConfirmation) {
                    Button("Sepiatone") { vm.setFilter(CIFilter.sepiaTone()) }
                    Button("Edges") { vm.setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { vm.setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { vm.setFilter(CIFilter.pixellate()) }
                    Button("Crystallize") { vm.setFilter(CIFilter.crystallize()) }
                    Button("Twirl Distortion") { vm.setFilter(CIFilter.twirlDistortion()) }
                    Button("Unsharp Mask") { vm.setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { vm.setFilter(CIFilter.vignette()) }
                } message: {
                    Text("Choose an effect to apply:")
                }
                .buttonStyleModifier()
                Spacer()
                Button("Save") {
                    vm.saveImageAtCoreImage()
                }
                .buttonStyleModifier()
                .alert("\(vm.saveMessage)", isPresented: $vm.showingSaveInfo) {}
                .opacity(!vm.disableButton ? 0.4 : 1.0)
                .disabled(!vm.disableButton)
            }
            .padding([.horizontal, .bottom])
        }
        .sheet(isPresented: $vm.showingImagePicker) {
            ImagePicker(image: $vm.inputImage)
        }
        .onChange(of: vm.inputImage) { _ in vm.loadImage() }
        .navigationTitle("InstaFilter App")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct InstaFilterAppView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InstaFilterAppView()
        }
    }
}
