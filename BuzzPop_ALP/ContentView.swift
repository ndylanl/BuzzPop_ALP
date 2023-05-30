//
//  ContentView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var bool = false
    
    @State private var selection: Tab = .game
    
    enum Tab {
        case game
        case history
        case profile
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 20/255, green: 25/255, blue: 35/255, alpha: 0.99)
        UITabBar.appearance().barTintColor = UIColor.gray
        }
    
    var body: some View {
        
            TabView(selection: $selection) {
                GameView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller")
                    }
                    .tag(Tab.game)
                
                HistoryView()
                    .tabItem {
                        Label("History", systemImage: "clock.arrow.circlepath")
                    }
                    .tag(Tab.history)
                
                ProfileView(user: User(ID: 1, username: "Reef", password: "reef123", score: 100, notification: true), showingEdit: $bool)
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
                    .tag(Tab.profile)
            }
            .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
