//
//  FilterView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/23/25.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedGenre: Genre?
    @Binding var selectedReading: ReadingStatus?
    
    var body: some View {
        Form{
            Section(header: Text("Filter by genre")){
                Picker("Genre", selection: $selectedGenre){
                    Text("Select a genre...").tag(nil as Genre?) // Case for not selecting a filter value
                    ForEach(Genre.allCases, id: \.self) { genre in
                        Text(genre.rawValue).tag(genre) // All filter possible values
                    }
                }
            }
            Section(header: Text("Filter by reading status")){
                Picker("Status", selection: $selectedReading){
                    Text("Select a reading status...").tag(nil as ReadingStatus?) // Case for not selecting a filter value
                    ForEach(ReadingStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status) // All filter possible values
                    }
                }
            }
        }
    }
}
