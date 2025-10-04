//
//  SettingsView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/25/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .light
    @AppStorage(SETTINGS_GRID_COLUMNS_KEY) private var gridColumns: Int =
        SETTINGS_GRID_COLUMNS_DEFAULT_VALUE
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentTintColor: Color = SETTINGS_ACCENT_COLOR_DEFAULT_VALUE
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $currentTheme) {
                        ForEach(Theme.allCases, id:\.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
//                    ColorPicker("Accent Color", selection:
//                         $accentTintColor)
                }
                Section(header: Text("Grid")){
                    Stepper("Columns: \(gridColumns)", value:
                        $gridColumns, in:1...4)
                }
            }
        }
    }
}
