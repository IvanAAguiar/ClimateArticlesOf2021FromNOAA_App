//
//  ImageSaver.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 26/10/2022.
//

import UIKit

class ImageSaver: NSObject {
    var sucessHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, ContextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            sucessHandler?()
        }
    }
}
