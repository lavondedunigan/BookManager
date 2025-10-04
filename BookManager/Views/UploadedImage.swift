//
//  UploadedImage.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 9/27/25.
//

import SwiftData
import Foundation

@Model
class UploadedImage {
    var imageName: String
    @Attribute(.externalStorage) var imageData: Data?
    
    init(imageName: String, imageData: Data? = nil) {
        self.imageName = imageName
        self.imageData = imageData
    }
}


// UploadedImage(incomingImageData: dataOfAn Image
