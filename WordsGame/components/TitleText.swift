//
//  TitleText.swift
//  WordsGame
//
//  Created by geka231 on 16.12.2022.
//

import SwiftUI

struct TitleText: View {
    
    @State var text: String

    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .frame(maxWidth:.infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Магнитотерапия")
    }
}
