//
//  Book.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var image: String = "default_book_image"
    var description: String = ""
    var author: String = ""
    var rating: Int = 0
    var review: String = ""
    var status: ReadingStatus = .unknown
    var genre: Genre = .unknown
    var isFavorite: Bool = false
}

