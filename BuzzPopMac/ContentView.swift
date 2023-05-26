//
//  ContentView.swift
//  BuzzPopMac
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var user = User(ID: 123, username: "John", password: "password", score: 100, notification: true)


    var body: some View {
        NavigationStack{
            ZStack {

                Color("primaryColor")
                
                VStack(spacing: 20) {
                    Image("Logo")
                    
                    Text("Welcome, John Doe")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    
                    // play game
                    NavigationLink(destination: ProfileView(user: user)) {
                        ZStack {
                            Color.white
                                .cornerRadius(15)
                            Text("Play Game")
                                .foregroundColor(Color("primaryColor"))
                                .font(.title)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(width: 300, height: 50, alignment: .center)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 300, height: 50, alignment: .center)
                    .buttonStyle(PlainButtonStyle())

                    // history
                    NavigationLink(destination: ProfileView(user: user)) {
                        ZStack {
                            Color.orange
                                .cornerRadius(15)
                            Text("History")
                                .foregroundColor(Color("primaryColor"))
                                .font(.title)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(width: 300, height: 50, alignment: .center)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 300, height: 50, alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    //profile
                    NavigationLink(destination: ProfileView(user: user)) {
                        ZStack {
                            Color.blue
                                .cornerRadius(15)
                            Text("Profile")
                                .foregroundColor(Color("primaryColor"))
                                .font(.title)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(width: 300, height: 50, alignment: .center)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 300, height: 50, alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    
                    //quit
                    Button(action: {
                        NSApplication.shared.terminate(nil)
                    }) {
                        ZStack {
                            Color.red
                                .cornerRadius(15)
                            Text("Quit")
                                .foregroundColor(Color("primaryColor"))
                                .font(.title)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(width: 300, height: 50, alignment: .center)
                            }
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
