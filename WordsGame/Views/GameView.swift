//
//  GameView.swift
//  WordsGame
//
//  Created by geka231 on 17.12.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    var viewModel: GameViewModel 
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Выход")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color(.orange))
                        .cornerRadius(10)
                        .font(.custom("AvenirNext-Bold", size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 30))
                .foregroundColor(.white)
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.player1.score)").font(.custom("AvenirNext-Bold", size: 60))
                    Text("\(viewModel.player1.name)").font(.custom("AvenirNext-Bold", size: 24))
                }.padding(20)
                    .frame(width: screen.width/2.2,height: screen.height/4.5)
                .background(Color("FirstPlayer"))
                .cornerRadius(20)
                .shadow(color: .purple, radius: 4)
                
                VStack {
                    Text("\(viewModel.player2.score)").font(.custom("AvenirNext-Bold", size: 60))
                    Text("\(viewModel.player2.name)").font(.custom("AvenirNext-Bold", size: 24))
                }.padding(20)
                    .frame(width: screen.width/2.2,height: screen.height/4.5)
                .background(Color("SecondPlayer"))
                .cornerRadius(20)
                .shadow(color: .pink, radius: 4)
            }
            
            TextFieldText(word: $word,
                          placeholder: "Ваше слово")
                .padding(.horizontal)
            Button {
                let score = viewModel.check(word: word)
                if score > 1 {
                    self.word = ""
                }

            } label: {
                Text("Готово")
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(.orange))
                    .cornerRadius(30)
                    .font(.custom("AvenirNext-Bold", size: 20))
                    .padding(.horizontal)
            }
            List{
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.background(Image("backPhoto"))
            
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(
            player1: Player(name: "Вася"),
            player2: Player(name: "Федя"),
            word: "рентгеноэлектрокардиографического"))
    }
}
