//
//  MainGameView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct MainGameView: View {
    @Binding var Focused: Bool
    @ObservedObject var viewModel: Game
    @Binding var searchText: String
    @ObservedObject var history: History

    var body: some View {
        if viewModel.lose{
            VStack{
                if(viewModel.lose){
                    Spacer()
                }
                Text("Score: \(viewModel.curPoints)")
                    .foregroundColor(Color.white)
                
                ForEach(viewModel.guesses, id: \.self){guess in
                    HStack {
                        Image(systemName: "xmark.app")
                            .foregroundColor(.red)
                        Text(guess)
                            .foregroundColor(Color.white)
                            .padding(.leading)
                        Spacer()
                    }
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .padding([.leading, .trailing])
                }
                Button(action: {
                    viewModel.loseGame(history: history)
                }) {
                    Text("New Game")
                }
                .padding()
                Spacer()
                Divider().background(Color.white)
            }
        }else{
            ZStack{
                if viewModel.correctAnswer{
                    Color.green
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.05)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                VStack{
                    Text("Score: \(viewModel.curPoints)")
                        .foregroundColor(Color.white)
                    
                    ForEach(viewModel.guesses, id: \.self){guess in
                        HStack {
                            Image(systemName: "xmark.app")
                                .foregroundColor(.red)
                            Text(guess)
                                .foregroundColor(Color.white)
                                .padding(.leading)
                            Spacer()
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    }
                    if viewModel.correctAnswer{
                        HStack {
                            Image(systemName: "checkmark.rectangle")
                                .foregroundColor(.green)
                            Text(viewModel.curMusic.title)
                                .foregroundColor(Color.white)
                                .padding(.leading)
                            Spacer()
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding([.leading, .trailing])
                    }
                    Spacer()
                    Divider().background(Color.white)
                }
                VStack{
                    Spacer()
                    if Focused{
                        ScrollView{
                            Spacer()
                            ForEach(viewModel.filteredSongTitles, id: \.self){guess in
                                HStack {
                                    Button(action:  {
                                        searchText = "\(guess.artist) - \(guess.title)"
                                    }){
                                        Text("\(guess.artist) - \(guess.title)")
                                            .foregroundColor(Color.white)
                                            .padding(.leading)
                                    }
                                    Spacer()
                                }
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .padding([.leading, .trailing])
                                .transition(.move(edge: .bottom)) // Drop-down animation
                                .transition(.opacity) // Drop-down animation
                                
                            }
                            //.animation(.spring(response: 0.2, dampingFraction: 0.55, blendDuration: 0.5 ))
                        }
                        .frame(maxHeight: 130)
                        .overlay(
                            Rectangle()
                                .stroke(Color.white, lineWidth: 0.1)
                        )
                    }
                }
            }
        }
//        .alert(isPresented: $viewModel.lose) {
//            Alert(title: Text("You Lose!"), message: Text("Total Score: \(viewModel.curPoints)"), dismissButton: .default(Text("New Game"), action: viewModel.loseGame))
//        }
    }
}
