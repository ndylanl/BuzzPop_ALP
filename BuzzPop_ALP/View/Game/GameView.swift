//
//  GameView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI
import AVFoundation


struct GameView: View {
    @StateObject private var viewModel = Game()
    @State private var filteredSongTitles: [String] = []
    @State private var Focused = false
    @State private var searchText = ""


    var body: some View {
        VStack(){
            MainGameView(Focused: $Focused, viewModel: viewModel, searchText: $searchText)
            Spacer()
            Divider().background(Color.white)
            GameControlView(searchText: $searchText, viewModel: viewModel, Focused: $Focused)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
        .onAppear {
            // Start updating the current time when the view appears
            viewModel.startUpdatingCurrentTime()
        }
        .onDisappear {
            // Stop updating the current time when the view disappears
            viewModel.stopUpdatingCurrentTime()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
