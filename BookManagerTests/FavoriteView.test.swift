//
//  FavoriteView.test.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 9/30/25.
//

import Testing
@testable import BookManager

@MainActor @Suite("Favorite View tests")
struct FavoriteViewTests {
    
    @Test("Filter function works correctly")
    func testFilterFunctionWorksCorrectly() {
        // Arrange
        let books = [
            Book(title:"Book1", isFavorite:true),
            Book(title:"Book2"),
            Book(title:"Book3"),
        ]
        let favoriteBooks = filterFavoriteBooks(books: books, selectedGenre: nil, selectedStatus: nil)
        
        // Assert
        #expect(favoriteBooks.count == 1)
        #expect(favoriteBooks[0].title == "Book1")
    }
    
}
