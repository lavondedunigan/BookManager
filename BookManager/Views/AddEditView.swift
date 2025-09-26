//
//  EditView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/16/25.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    @State private var workingBook: Book
    @Environment(\.dismiss) var dismiss
    @State private var navigationTitle: String
    
    init(book: Binding<Book>) {
        self._book = book
        _workingBook = .init(initialValue: book.wrappedValue) //creating a copy to edit
        self._navigationTitle = State(initialValue: book.wrappedValue.title.isEmpty ? "Add a new book" : "Edit book")
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(
                    gradient: Gradient(
                        colors: [.gray.opacity(0.1), .gray.opacity(0.3)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                Form {
                    Section(header: Text("Book details")) {
                        TextField("Title of the book", text: $workingBook.title)
                        TextField("Author", text: $workingBook.author)
                        Picker("Genre", selection: $workingBook.genre){
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                        TextEditor(text: $workingBook.description)
                            .frame(height: 150)
                    }
                    Section(header: Text("My review")) {
                        StarRatingView(rating: $workingBook.rating)
                        Picker("Reading status", selection: $workingBook.status){
                            ForEach(ReadingStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        TextEditor(text: $workingBook.review)
                            .frame(height: 150)
                    }
                }
                .navigationTitle(navigationTitle)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save") {
                            //save the value
                            book = workingBook
                            dismiss()
                        }
                        .disabled(workingBook.title.isEmpty)
                    }
                    
                }
            }
        }
    }
}

