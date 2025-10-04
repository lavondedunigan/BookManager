//
//  PersistentBook.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 10/4/25.
//

import Foundation
import SwiftData

@Model
class PersistentBook {
   
    var title: String
    //var image: String = "default_book_image"
    var imageData: Data?
    var summary: String
    var author: String
    var rating: Int
    var review: String
    var status: ReadingStatus
    var genre: Genre
    var isFavorite: Bool
    
    init(title: String, imageData: Data? = nil, summary: String = "", author: String = "", rating: Int = 0, review: String = "", status: ReadingStatus = .unknown, genre: Genre = .unknown, isFavorite: Bool = false) {
        self.title = title
        self.imageData = imageData
        self.summary = summary
        self.author = author
        self.rating = rating
        self.review = review
        self.status = status
        self.genre = genre
        self.isFavorite = isFavorite
    }
    
    
}
