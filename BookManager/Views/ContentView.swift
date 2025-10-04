//
//  ContentView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//
// Imperative vs Declarative Swift UI

// deprecated

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var books:[PersistentBook]
    
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = .light
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentTintColor: Color = SETTINGS_ACCENT_COLOR_DEFAULT_VALUE
    
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
            BookListView()
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            ImageViewer()
                .tabItem {
                    Label("Images", systemImage: "photo")
        }
        }
       // .tint(accentTintColor)
        .preferredColorScheme(colorScheme)
    }
}

#Preview {
    ContentView()
}
