//
//  FavoritesView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/18/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State var isFilteringSheetPresented: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReading: ReadingStatus?
    
    //computed property
    private var favoriteBooks: [Binding<Book>] {
        $books.filter {
            $0.wrappedValue.isFavorite
            && ( // filter by genre if filter is set
                selectedGenre == nil
                || $0.wrappedValue.genre == selectedGenre
            )
            && ( // filter by status if filter is set
                selectedReading == nil
                || $0.wrappedValue.status == selectedReading
            )
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                if(selectedGenre != nil){
                    Text("Current genre filter: \(selectedGenre!.rawValue)")
                }
                if(selectedReading != nil) {
                    Text("Current filter: \(selectedReading!.rawValue)")
                }
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks, id: \.self.id) { bindingToBook in
                        NavigationLink(destination: BookDetailView(book: bindingToBook)){
                            SquareCardView(book: bindingToBook)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("My favorite books")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { isFilteringSheetPresented = true }){
                        //Content of the button
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Open filter options")
                }
            }
            .sheet(isPresented: $isFilteringSheetPresented){
                FilterView(
                    selectedGenre: $selectedGenre,
                    selectedReading: $selectedReading
                )
            }
            
        }
    }
}
