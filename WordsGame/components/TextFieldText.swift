//
//  TextFieldText.swift
//  WordsGame
//
//  Created by geka231 on 17.12.2022.
//

import SwiftUI

struct TextFieldText: View {
    
    @State var word: Binding<String>
    var placeholder : String
    
    var body: some View {
        TextField(placeholder, text: word)
            .font(.title3)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}

