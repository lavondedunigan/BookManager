//
//  Genre.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/23/25.
//

enum Genre: String, CaseIterable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case romance = "Romance"
    case horror = "Horror"
    case dystopian = "Dystopian"
    // Base case
    case unknown = "Unknown"
}
