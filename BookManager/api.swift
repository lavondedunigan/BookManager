//
//  api.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/11/25.
//

import Foundation

func getBooks() -> [Book] {
    return [ //hardcoded
        Book(title:"The Fellowship of the Ring",
             image:"lotr_fellowship",
             description:"The first book in the trilogy",
            ),
        Book(title:"The Two Towers",
             image:"lotr_towers",
             description:"The second book in the trilogy",
            ),
        Book(title:"The Return of The King",
             image:"lotr_king",
             isFavorite: true
//             description:"The third and last book in the trilogy",
            ),
        Book(title:"Empty book",
             description:"This is a test book",
             isFavorite: true
            )
    ]
    
}
