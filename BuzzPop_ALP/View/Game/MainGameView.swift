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

    var body: some View {
        ZStack{
            VStack{
                Text(String(viewModel.curPoints))
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
                Spacer()
            }
            VStack{
                Spacer()
                if Focused{
                    ForEach(viewModel.filteredSongTitles, id: \.self){guess in
                        HStack {
                            Button(action:  {
                                searchText = guess.title
                            }){
                                Text(guess.title)
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
                    .animation(.spring(response: 0.4, dampingFraction: 0.55, blendDuration: 0.5 )) // Add animation modifier
                }
            }
        }
    }
}
