//
//  BookDetailView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//
import SwiftUI

struct BookDetailView: View {
    
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [.gray.opacity(0.1), .gray.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack{
                        Image(book.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 100, maxHeight: 150)
                            .padding(.vertical,20)
                        VStack{
                            Text(book.title)
                                .font(.system(size: 36, weight: .bold, design: .serif))
                            if (book.author != ""){
                                Text("by \(book.author)")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    HStack{
                        if (book.genre != .unknown){
                            CustomCapsule(text: book.genre.rawValue)
                        }
                        if (book.status != .unknown){
                            CustomCapsule(text: book.status.rawValue, color: .secondary)
                        }
                        Spacer()
                        FavoriteToggle(isFavorite: $book.isFavorite)
                    }
                    if (book.description != "") {
                        Text(book.description)
                    }
                    
                    if(book.rating == 0){
                        Text("No rating yet")
                    } else{
                        Text("Rating: \(book.rating)\(book.rating==1 ? " star" : " stars")")
                    }
                    Text(book.review)
                }
                .padding()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action: {
            showEditSheet.toggle()
        }))
        .sheet(isPresented: $showEditSheet, content: {
            AddEditView(book: $book)
        })
    }
}
