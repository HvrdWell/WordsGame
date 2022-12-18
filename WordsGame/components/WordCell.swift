//
//  WordCell.swift
//  WordsGame
//
//  Created by geka231 on 19.12.2022.
//

import SwiftUI

struct WordCell: View {
    
    let word: String
    
    var body: some View {
        HStack{
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-bold", size: 22))
            Text("\(word.count)")
                .padding()
                .font(.custom("AvenirNext-bold", size: 22))
                .foregroundColor(.white)
        }
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: "Магнит")
    }
}
