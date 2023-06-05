//
//  GameControlView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct GameControlView: View {
    @Binding var searchText: String
    @ObservedObject var viewModel: Game
    @FocusState private var isSearchBoxFocused: Bool
    @Binding var Focused: Bool
    
    var body: some View {

        VStack{
            HStack{
                Text(viewModel.formatTime(viewModel.audioPlayer?.currentTime ?? 0.0))
                Spacer()
                Button(action: {
                    withAnimation {
                        //                        isPlaying.toggle()
                    }
                    viewModel.playMusic()
                    
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.green)
                        .background(Color.white.opacity(0.98))
                        .cornerRadius(200)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Text(viewModel.formatTime(TimeInterval(viewModel.duration)))
            }
            .padding([.leading, .trailing])
            .padding([.leading, .trailing])
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .focused($isSearchBoxFocused)
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .cornerRadius(10)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 1)
            )
            .padding()
            .onChange(of: isSearchBoxFocused) { focused in
                if focused {
                    Focused = true
                } else {
                    Focused = false
                }
            }
            .onChange(of: searchText) { newValue in
                viewModel.updateFilteredSongTitles(guess: searchText)
            }
            if(!viewModel.lose){
                HStack{
                    Button(action: {
                        viewModel.increaseDuration(amount: 5)
                    }) {
                        Text("Skip(+5s)")
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.white, lineWidth: 1)
                                    .frame(width: 110, height: 45)
                            )
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        viewModel.guessAnswer(guess: searchText)
                        searchText = ""
                    }) {
                        Text("Submit")
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.white, lineWidth: 1)
                                    .frame(width: 110, height: 45)
                            )
                    }
                    .padding()
                    .padding(.trailing, 10)
                }
                .padding([.leading, .trailing])
                .padding([.leading, .trailing])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 1.8))
        .foregroundColor(Color.white)
    }
}

