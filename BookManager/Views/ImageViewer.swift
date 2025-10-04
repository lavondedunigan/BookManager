//
//  ImageViewer.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 9/27/25.
//

import SwiftUI
import SwiftData

struct ImageViewer: View {
    @Query var images: [UploadedImage] // getBooks()
    var body: some View {
        NavigationStack{
            VStack{
                if(images.isEmpty){
                    Text("No images found")
                } else{
                    List(images, id: \.id) { image in
                        HStack{
                            Image(
                                uiImage: UIImage(data: (image.imageData as Data?)!)
                                ?? UIImage(resource: .defaultBook)
                            )
                            .resizable()
                            .frame(width: 100, height: 100)
                            //Text(image.filename)
                            Text(image.imageName)
                            
                            Text("ID: \(image.id)")
                        }
                    }}
            
                
                
            }
            .navigationTitle("Images")
        }
    }
}
