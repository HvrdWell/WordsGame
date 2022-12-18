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
    @State private var confirmPresent = false
    @State private var isAlertPreset = false
    @State var alertText = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
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
                    .shadow(color: viewModel.isFirst ? .purple : .clear, radius: 5)
                
                VStack {
                    Text("\(viewModel.player2.score)").font(.custom("AvenirNext-Bold", size: 60))
                    Text("\(viewModel.player2.name)").font(.custom("AvenirNext-Bold", size: 24))
                }.padding(20)
                    .frame(width: screen.width/2.2,height: screen.height/4.5)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(20)
                    .shadow(color: viewModel.isFirst ? .clear :  .pink, radius: 5)
            }
            
            TextFieldText(word: $word,
                          placeholder: "Ваше слово")
            .padding(.horizontal)
            Button {
                var score = 0
                do{
                    try score = viewModel.check( word:  word )
                }catch WordError.beforeWord{
                    alertText = "Прояви фантазию! Придумай новое слово"
                    isAlertPreset.toggle()
                }
                catch WordError.littleWord{
                    alertText = "Слишком короткое слово"
                    isAlertPreset.toggle()
                }
                catch WordError.theSameWord{
                    alertText = "Думаешь самый умный? Составленное слово не должно быть исходным словом"
                    isAlertPreset.toggle()
                }
                catch WordError.wrongWord{
                    alertText = "Неизвестная ошибка"
                    isAlertPreset.toggle()
                }
                catch{
                    //test
                }
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
                
                ForEach(0..<self.viewModel.words.count, id: \.description) {  item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.background(Image("backPhoto"))
            .confirmationDialog("Вы уверны, что хотите завершить игру?",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button(role: .destructive) {
                    self.dismiss()
                } label: {
                    Text("Точно выйти")
                }
                Button(role: .cancel) { }label: {
                    Text("Нет")
                }
                
            }
                                .alert(alertText,
                                       isPresented: $isAlertPreset) {
                                    Text("Ок, понял...")
                                }
        
        
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
