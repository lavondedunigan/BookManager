//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
        
    }
    init(){
        do {
            modelContainer = try ModelContainer(for:UploadedImage.self, PersistentBook.self)
        } catch {
            fatalError("Failed to load model container")
        }
    }

}
