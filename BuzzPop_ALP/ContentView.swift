//
//  ContentView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false

    @State var bool = false
    
    @State private var selection: Tab = .game
    @StateObject var user = User(ID: 1, username: "Bob", password: "", score: 0, notification: true)
    @StateObject var history = History()
    
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
        
        if isOnboardingViewActive{
            
            TabView(selection: $selection) {
                GameView(user: user, history: history)
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller")
                    }
                    .tag(Tab.game)
                
                HistoryView(history: history)
                    .tabItem {
                        Label("History", systemImage: "clock.arrow.circlepath")
                    }
                    .tag(Tab.history)
                
                ProfileHost(user: user)
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
                    .tag(Tab.profile)
            }
            .accentColor(.green)
        } else{
            OnboardingView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
