//
//  AddEditViewModel.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 10/2/25.
//

import SwiftUI
import SwiftData

@MainActor
class AddEditViewModel: ObservableObject {
    
    private var bookToEdit: PersistentBook?
    private let modelContext: ModelContext
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var description: String = ""
    @Published var rating: Int = 0
    @Published var review: String = ""
    @Published var summary: String = ""
    @Published var status: ReadingStatus = .unknown
    @Published var genre: Genre = .unknown
    @Published var isFavorite: Bool = false
    @Published var cover: UIImage? = nil
    
    // Computed properties
    var navigationTitle: String {
        bookToEdit != nil ? "Edit Book" : "Add Book"
    }
    
    var isSaveButtonDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        || (title == bookToEdit?.title
        && author == bookToEdit?.title
        && summary == bookToEdit?.summary
        && rating == bookToEdit?.rating
        && review == bookToEdit?.review
        && status == bookToEdit?.status
        && genre == bookToEdit?.genre
        && isFavorite == bookToEdit?.isFavorite)
    }
    init(book: PersistentBook? = nil,modelContext: ModelContext) {
        self.bookToEdit = book
        self.modelContext = modelContext
        
        // if the book is not nil, then we're editing insted of adding
        if let book {
            self.title = book.title
            self.author = book.author
            self.summary = book.summary
            self.rating = book.rating
            self.review = book.review
            self.status = book.status
            self.genre = book.genre
            self.isFavorite = book.isFavorite
            if let coverData = book.imageData {
                self.cover = UIImage(data: coverData)
                
            }
        
        }
        
    }
    func save() {
        let isANewBook = bookToEdit == nil
        var bookToSave = bookToEdit ?? PersistentBook(title:"")
        bookToSave.title = title
        bookToSave.author = author
        bookToSave.genre = genre
        bookToSave.rating = rating
        bookToSave.status = status
        bookToSave.summary = summary
        bookToSave.review = review
        if(cover != nil){
            bookToSave.imageData = cover?.jpegData(compressionQuality: 0.8)
        }
        
        if isANewBook {
          modelContext.insert(bookToSave)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save the book: \(error)")
            

        
        }
    }

}
