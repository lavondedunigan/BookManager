//
//  AddEditViewModel.test.swift
//  BookManager
//
//  Created by Lavonde Dunigan on 10/2/25.
//

import Testing
import SwiftData
@testable import BookManager

@MainActor
struct AddEditViewModelTests {
    
    
    
    @Test("ViewModel initalizes correctly for a new book")
    func testNewBookInitialization() throws {
        // phase 1: Arrange
        let container = try ModelContainer(/*for: PersistentBook.self,*/
            configurations: .init(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        
        // phase 2: Act
        let viewModel = AddEditViewModel(modelContext: modelContext)
        
        
        // phase 3: Asseert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        // every other field assertions
        #expect(viewModel.navigationTitle == "Add Book")
        #expect(viewModel.isSaveButtonDisabled)
        
    }
    
    @Test("ViewModel initalizes correctly for an existing book")
    func testExistingBookInitialization() throws {
        // phase 1: Arrange
        let container = try ModelContainer(/*for: PersistentBook.self,*/
            configurations: .init(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        let book = Book(title: "Test book", author: "Test Author", genre: .fantasy)
        
        // phase 2: Act
        let viewModel = AddEditViewModel(book: book, modelContext: modelContext)
        
        
        // phase 3: Assert
        #expect(viewModel.title == "Test Book")
        #expect(viewModel.author == "Test Author")
        // every other field assertions
        #expect(viewModel.navigationTitle == "Edit Book")
        #expect(viewModel.isSaveButtonDisabled)
        
        // Check small changes
        // Act 2
        viewModel.title = "\n"
        #expect(viewModel.isSaveButtonDisabled)
        // Assert 2
        viewModel.title = "Test Book"
        #expect(viewModel.isSaveButtonDisabled)
        viewModel.title = "Test Book"
        #expect(!viewModel.isSaveButtonDisabled)
    }
    
    @Test("ViewModel creates a new book correctly")
    func testCreateNewBook() throws {
        // phase 1: Arrange
        
        
        // phase 1: Act
        
        
        // phase 3: Assert
        
    }
    
    @Test("ViewModel updates an existing book correctly")
    func testUpdateExistingBook() throws {
        
    }
}
