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
    @State var isAlertPresentes = false

    
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
                if bigWord.count > 7 {
                    isShowGame.toggle()
                }
                else{
                    self.isAlertPresentes.toggle()
                }
                
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
            .alert("Длинное слово слишком короткое", isPresented: $isAlertPresentes, actions: {
                Text("Хорошо!")
            })
            .fullScreenCover(isPresented: $isShowGame) {
                let name1 = firstPlayer == "" ? "Игрок 1" : firstPlayer
                let name2 = secondPlayer == "" ? "Игрок 2" : secondPlayer

                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                let gameViewModel = GameViewModel(player1: player1, player2: player2, word: bigWord)

                GameView(viewModel: gameViewModel)
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
