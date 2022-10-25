//
//  FilterViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 25/10/2022.
//

import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI

class FilterViewModel: ObservableObject {
        
    @Published var image: Image?
    @Published var inputImage: UIImage?
    @Published var showingImagePicker = false
    @Published var amount = 1.0
        
    init() {
        loadImage()
    }
    
    
    func loadImage() {
        guard let uiImage = inputImage ?? UIImage(named: "Exemple") else { return }
        image = Image(uiImage: uiImage)
    }
    
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//    }
    
    func sepiaTone() {
        let beginImage = CIImage(image: inputImage ?? UIImage(named: "Exemple")!)

        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 3
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage:  cgimg)
            image = Image(uiImage: uiImage)
        }
    }
    
    func pixellate() {
        let beginImage = CIImage(image: inputImage ?? UIImage(named: "Exemple")!)

        let context = CIContext()
        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage
        currentFilter.scale = 15
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage:  cgimg)
            image = Image(uiImage: uiImage)
        }
    }
    
    func crystallize() {
        let beginImage = CIImage(image: inputImage ?? UIImage(named: "Exemple")!)

        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 15
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage:  cgimg)
            image = Image(uiImage: uiImage)
        }
    }
    
    func twirDistortion() {
        let beginImage = CIImage(image: inputImage ?? UIImage(named: "Exemple")!)

        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 850
        currentFilter.center = CGPoint(
            x: inputImage!.size.width / 2,
            y: inputImage!.size.height / 2
        )
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage:  cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @ObservedObject var vm: FilterViewModel
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.vm.inputImage = image as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
