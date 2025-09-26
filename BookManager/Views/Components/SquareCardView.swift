//
//  SquareCardView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/18/25.
//

import SwiftUI

struct SquareCardView : View {
    @Binding var book: Book
    
    var body: some View {
//        VStack{
//            Text(book.title)
//                .font(.headline)
//                .lineLimit(2)
//                .multilineTextAlignment(.center)
//            Spacer()
//            Text(book.author)
//                .font(.subheadline)
//                .lineLimit(1)
//        }
//        .padding(8)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.gray)
//        .aspectRatio(1, contentMode: .fit)
//        .cornerRadius(12)
        VStack {
            Text(book.title)
                .frame(maxWidth: .infinity) // We want the text
                .font(.headline) // assignment
                .foregroundColor(.white)
                .lineLimit(2) // Good for titles that might wrap
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.clear, .black.opacity(0.8)],
                    startPoint: .bottom,
                    endPoint: .top
                ))
            Spacer() // Pushes content to top and bottom
            Text(book.author)
                .frame(maxWidth: .infinity)
                .font(.subheadline) // assignment
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(4)
                .background(LinearGradient(
                    colors: [.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(book.image)
                .resizable()
                .scaledToFill().opacity(0.9)
        )
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
