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
                List(viewModel.guesses, id: \.self) { songTitle in
                    Text(songTitle)
                }
                .padding()
                .padding()
                Spacer()
                if Focused {
                    List(viewModel.filteredSongTitles, id: \.self) { songTitle in
                    Button(action: {
                        searchText = songTitle.title
                    }) {
                        Text(songTitle.title)
                    }
                }
                .listStyle(.plain)
                .frame(height: 70)
                }
            }
        }
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
    }
}
