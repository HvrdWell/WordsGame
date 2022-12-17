//
//  ContentView.swift
//  WordsGame
//
//  Created by geka231 on 16.12.2022.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var firstPlayer = ""
    @State var secondPlayer = ""

    @State var isShowGame = false
    
    var body: some View {
        
        VStack{
            TitleText(text: "Words Game")
                
            
            TextFieldText(word: $bigWord, placeholder: "Введите большое слово")
                .padding()
            
            VStack{
                TextFieldText(word: $firstPlayer, placeholder: "Имя 1 игрока")
                
                TextFieldText(word: $secondPlayer, placeholder: "Имя 2 игрока")
            }.padding(.top)
                .padding(.horizontal)
            
            Button {
                isShowGame.toggle()
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext_Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(90)
                    .padding(.top)
                          
            }

            
        }.background(Image("backPhoto"))
            .fullScreenCover(isPresented: $isShowGame) {
                GameView()
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
