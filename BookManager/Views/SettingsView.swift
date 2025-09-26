//
//  SettingsView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/25/25.
//

import SwiftUI

struct SettingsView: View {
    
//    @State var currentThemeState: Theme = .light
    @AppStorage(SETTINGS_THEME_KEY) var currentTheme: Theme = .light
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $currentTheme) {
                        ForEach(Theme.allCases, id:\.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                }
            }
        }
    }
}
