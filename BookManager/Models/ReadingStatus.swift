//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/23/25.
//

enum ReadingStatus: String, CaseIterable {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    // Base case
    case unknown = "Unknown"
}
