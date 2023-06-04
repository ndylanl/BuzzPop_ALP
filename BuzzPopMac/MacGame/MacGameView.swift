//
//  MacGameView.swift
//  BuzzPopMac
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct MacGameView: View {
    @StateObject private var viewModel = Game()
    @State private var filteredSongTitles: [String] = []
    @State private var Focused = false
    @State private var searchText = ""
    
    var body: some View {
        ZStack{
            
            VStack(){
                MacTopGameView(Focused: $Focused, viewModel: viewModel, searchText: $searchText)
                    .padding(.top)
                    .padding(.top)
                    .padding(.top)
                Spacer()
                if(!viewModel.lose){
                    MacGameControlView(searchText: $searchText, viewModel: viewModel, Focused: $Focused)
                        .frame(maxHeight: 90)
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
                Alert(title: Text("Correct!"), message: Text("\(viewModel.guessCount + 1)/5 guesses used! +\(viewModel.pointsAwarded)"), dismissButton: .default(Text("Next"), action: viewModel.confirmNext))
            }
        }
    }
}

struct MacGameView_Previews: PreviewProvider {
    static var previews: some View {
        MacGameView()
    }
}