//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Jorge Gabriel Marin Urias on 9/23/25.
//

import SwiftUI

struct CustomCapsule: View {
    var text: String
    var color = Color.accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
