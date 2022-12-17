//
//  GameView.swift
//  WordsGame
//
//  Created by geka231 on 17.12.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
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
                        .font(.custom("AvenirNext_Bold", size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            TitleText(text: "Магнитотерапия")
            HStack(spacing: 12) {
                VStack {
                    Text("0").font(.custom("AvenirNext_Bold", size: 60))
                    Text("Вася").font(.custom("AvenirNext_Bold", size: 24))
                }.padding(20)
                    .frame(width: screen.width/2.2,height: screen.height/4.5)
                .background(Color("FirstPlayer"))
                .cornerRadius(20)
                .shadow(color: .purple, radius: 4)
                
                VStack {
                    Text("0").font(.custom("AvenirNext_Bold", size: 60))
                    Text("Петя").font(.custom("AvenirNext_Bold", size: 24))
                }.padding(20)
                    .frame(width: screen.width/2.2,height: screen.height/4.5)
                .background(Color("SecondPlayer"))
                .cornerRadius(20)
                .shadow(color: .pink, radius: 4)
            }
            
            TextFieldText(word: $word, placeholder: "Ваше слово")
                .padding(.horizontal)
            Button {
                print("ready")
                self.word = ""
            } label: {
                Text("Готово")
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(.orange))
                    .cornerRadius(30)
                    .font(.custom("AvenirNext_Bold", size: 20))
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
        GameView()
    }
}
