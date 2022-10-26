//
//  FilterViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 25/10/2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI

class FilterViewModel: ObservableObject {
        
    @Published var image: Image?
    @Published var inputImage: UIImage?
    private var processedImage: UIImage?
    
    @Published var showingImagePicker = false
    @Published var showingConfirmation = false
    @Published var showingSaveInfo = false
    @Published var disableButton = false

    @Published var intensity = 0.0
    @Published var saveMessage = ""
    @Published private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()

    init() {
        loadImage()
    }
    
    func loadImage() {
        guard let uiImage = inputImage else { return }
        
        let beginImage = CIImage(image: uiImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(intensity * 10, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(intensity * 1500, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(intensity * 70, forKey: kCIInputScaleKey)}
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage:  cgimg)
            self.processedImage = uiImage

            image = Image(uiImage: uiImage)
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        self.currentFilter = filter
        loadImage()
    }
    
    func saveImageAtCoreImage() {
        guard let toSave = processedImage else {return}
        let imageSaver = ImageSaver()
        
        imageSaver.writeToPhotoAlbum(image: toSave)
        imageSaver.sucessHandler = { print("Saved successfully.") }
        imageSaver.errorHandler = { print("Oops! \($0.localizedDescription)") }
        
        showingSaveInfo = true
        disableButton = false
    }
}
