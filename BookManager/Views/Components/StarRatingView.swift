//
//  StarRatingView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/18/25.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { starRate in
                Button(action: {
                    rating = starRate
                }) {
                    // ternary operator
                    // Image(systemName: "star.fill") // when starRate <= rating == true
                    // Image(systemName: "star") // when starRate <= rating == false
                    Image(systemName: starRate <= rating ? "star.fill" :"star")
                        .foregroundColor(.yellow)
                        .font(.title2)
                }.buttonStyle(.plain)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityValue("\(rating) out of 5 stars")
        .accessibilityLabel("Book Rating")
        .accessibilityAdjustableAction { direction in
            switch direction {
                case .increment: // if direction == .increment:
                    rating = min(rating + 1, 5)
                case .decrement: // else if direction == .decrement
                    rating = max(rating - 1, 1)
                @unknown default: // else
                    break
            }
        }
    }
}
