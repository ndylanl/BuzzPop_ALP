//
//  MacGameControlView.swift
//  BuzzPopMac
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct MacGameControlView: View {
    @Binding var searchText: String
    @ObservedObject var viewModel: Game
    @FocusState private var isSearchBoxFocused: Bool
    @Binding var Focused: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.formatTime(viewModel.audioPlayer?.currentTime ?? 0.0))
                    .padding(.top)
                Spacer()
                Button(action: {
                    withAnimation {
//                        isPlaying.toggle()
                    }
                    viewModel.playMusic()

                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .background(Color.white.opacity(0.98))
                        .cornerRadius(200)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Text(viewModel.formatTime(TimeInterval(viewModel.duration)))
                    .padding(.top)
            }
            .padding([.leading, .trailing])
            .padding([.leading, .trailing])
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .focused($isSearchBoxFocused)
                    .cornerRadius(16)
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                    }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                    }
                }
            }
            .cornerRadius(16)
            .padding(.bottom)
            .padding([.leading, .trailing])
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
                    }
                    Spacer()
                    Button(action: {
                        viewModel.guessAnswer(guess: searchText)
                        searchText = ""
                    }) {
                        Text("Submit")
                    }
                }
                .padding([.leading, .trailing])
                .padding([.leading, .trailing])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 70)
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 1.8))
        .foregroundColor(Color.white)
    }
}


