//
//  BookListItemView.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//

import SwiftUI

struct BookListItemView: View {
    let book: PersistentBook
    
    var body: some View {
        HStack {
            Image(
                uiImage: (book.imageData != nil ? UIImage(data: book.imageData!)
                :UIImage(resource: .defaultBook))!)
            
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
            VStack(alignment: .leading){ //LTR or RTL i18n
                Text(book.title)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Text(book.summary)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .padding(4)
            }
        }
    }
}


