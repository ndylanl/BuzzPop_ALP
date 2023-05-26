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
//                List(viewModel.guesses, id: \.self) { songTitle in
//                    Text(songTitle)
//                        .background(Color.clear)
//                }
//                .padding([.leading, .trailing])
//                .padding([.leading, .trailing])
                Spacer()
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
//                if Focused {
//                    List(viewModel.filteredSongTitles, id: \.self) { songTitle in
//                    Button(action: {
//                        searchText = songTitle.title
//                    }) {
//                        Text(songTitle.title)
//                    }
//                }
//                .listStyle(.plain)
//                }
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
                    }
                }
            }
        }
    }
}
