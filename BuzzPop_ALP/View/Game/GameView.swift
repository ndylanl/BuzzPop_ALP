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
    @ObservedObject var user: User
    @ObservedObject var history: History
    
    
    var body: some View {
        ZStack{
            
            VStack(){
                MainGameView(Focused: $Focused, viewModel: viewModel, searchText: $searchText, history: history)
                Spacer()
                if(!viewModel.lose){
                    GameControlView(searchText: $searchText, viewModel: viewModel, Focused: $Focused)
                        .padding(.bottom)
                        .padding(.bottom)
                        .padding(.bottom)
                }
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
            .alert(isPresented: $viewModel.correctAnswer) {
                Alert(title: Text("Correct!"), message: Text("\(viewModel.guessCount + 1)/5 guesses used! +\(viewModel.pointsAwarded)"), dismissButton: .default(Text("Next"), action: {viewModel.confirmNext(user: user)}))
            }
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
