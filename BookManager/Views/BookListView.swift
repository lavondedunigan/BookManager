//
//  BookListView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/18/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Query var books:[PersistentBook]
    @State var showAddView: Bool = false
    @State var newBook = Book(title:"")
    @Environment(\.modelContext) private var modelContext;
    
    var body: some View {
        NavigationStack {
            List(books, id: \.self.id) { bookItem in
                NavigationLink(destination: BookDetailView(book: bookItem)){
                    BookListItemView(book: bookItem)
                }
                //                .border(Color.red)
            }
            .navigationBarTitle("Book Manager")
            //            .border(Color.blue)
            .navigationBarItems(trailing: Button("Add", action: {
                showAddView.toggle()
            }))
            .sheet(
                isPresented: $showAddView,
            ) {//onDimiss: This is run when "dismiss()" is executed in the content view
                //only append book if title is not empty
//                if !newBook.title.isEmpty {
//                    books.append(newBook)
               // }
                //Reset newBook state to a completely new book
//                newBook = Book(title: "")
            } content: {
                AddEditView(modelContext: modelContext)
            }
        }
    }
}
