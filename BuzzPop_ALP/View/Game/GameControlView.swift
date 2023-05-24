//
//  GameControlView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct GameControlView: View {
    @State var searchText: String
    @ObservedObject var viewModel: Game
    @FocusState private var isSearchBoxFocused: Bool
    
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
            if isSearchBoxFocused {
                List(viewModel.filteredSongTitles, id: \.self) { songTitle in
                Button(action: {
                    searchText = songTitle.title
                    isSearchBoxFocused = false
                }) {
                    Text(songTitle.title)
                }
            }
            .listStyle(.plain)
            .frame(height: 70)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .focused($isSearchBoxFocused)
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                        //viewModel.guessAnswer(guess:searchText)
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
            
            HStack{
                Button(action: {
                    viewModel.increaseDuration(amount: 5)
                }) {
                    Text("Skip(+5s)")
                }
                Spacer()
                Button(action: {
//                    viewModel.guessAnswer()
                    viewModel.nextMusic()
                }) {
                    Text("Submit")
                }
            }
            .padding([.leading, .trailing])
            .padding([.leading, .trailing])

            
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 1.8))
        .foregroundColor(Color.white)
    }
}

