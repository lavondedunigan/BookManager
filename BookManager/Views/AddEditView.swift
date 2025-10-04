//
//  EditView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/16/25.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    @StateObject private var viewModel: AddEditViewModel
    
    @Environment(\.dismiss) var dismiss
    
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        _viewModel = StateObject(
            wrappedValue: AddEditViewModel(
                book: book,
                modelContext: modelContext)
        )
        
        
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
                    Section(header: Text("BookCover")){
                        ImageField(image: $viewModel.cover)
                    }
                    Section(header: Text("Book details")) {
                        TextField("Title of the book", text: $viewModel.title)
                        TextField("Author", text: $viewModel.author)
                        Picker("Genre", selection: $viewModel.genre){
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                        TextEditor(text: $viewModel.summary)
                            .frame(height: 150)
                    }
                    Section(header: Text("My review")) {
                        StarRatingView(rating: $viewModel.rating)
                        Picker("Reading status", selection: $viewModel.status){
                            ForEach(ReadingStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        TextEditor(text: $viewModel.review)
                            .frame(height: 150)
                    }
                }
            }
            //acutally save the value
            .navigationTitle(viewModel.navigationTitle)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save") {
                        viewModel.save()
                        dismiss()
                    }
                    .disabled(viewModel.isSaveButtonDisabled)
                }
                
            }
        }
    }
    
    
    
    
    
    
    
}
