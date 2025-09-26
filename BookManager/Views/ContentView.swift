//
//  ContentView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//
// Imperative vs Declarative Swift UI

// deprecated

import SwiftUI

struct ContentView: View {
    @State var books = getBooks()
    
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = .light
    
    var colorScheme: ColorScheme? {
        switch(theme) {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
    
    var body: some View {
        TabView {
            BookListView(books: $books)
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(colorScheme)
    }
}

#Preview {
    ContentView()
}
