//
//  FavoritesView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/18/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) private var gridColumns: Int = SETTINGS_GRID_COLUMNS_DEFAULT_VALUE
    
    @Query var books:[PersistentBook]
    @State var isFilteringSheetPresented: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedStatus: ReadingStatus?
    
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(), count: gridColumns)
    }
    //computed property
    private var favoriteBooks: [PersistentBook] { // why this is not set in init
        filterFavoriteBooks(books: books, selectedGenre: selectedGenre, selectedStatus: selectedStatus)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                if(selectedGenre != nil){
                    Text("Current genre filter: \(selectedGenre!.rawValue)")
                }
                if(selectedStatus != nil) {
                    Text("Current filter \(selectedStatus!.rawValue)")
                }
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks, id: \.self.id) { book in
                        NavigationLink(destination: BookDetailView(book: book)){
                            SquareCardView(book: book)
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
                    selectedReading: $selectedStatus
                )
            }
            
        }
    }
    func filterFavoriteBooks(books: [PersistentBook], selectedGenre: Genre?, selectedStatus: ReadingStatus?, isNegative: Bool?=false) -> [PersistentBook] {
        return books.filter {
            //$0 = one book in books
            (isNegative! ? !$0.isFavorite : $0.isFavorite)
            && (
                selectedGenre == nil || $0.genre == selectedGenre!
            )
            && (
                selectedStatus == nil || $0.status == selectedStatus!
            )
        }
        
    }
}
