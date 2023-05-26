//
//  ProfileView.swift
//  BuzzPopMac
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Profile")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            
            // Username
            HStack {
                Text(user.username)
                    .bold()
                    .font(.title)
                    .padding(.trailing)
                Text("#\(user.ID)")
            }
            .foregroundColor(.white)
            
            Text("Score:")
                .bold()
                .font(.title2)
                .foregroundColor(.white)
            
            // Score
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.trailing)
                
                Text("\(user.score) Points")
            }
            .padding(.bottom)
            .foregroundColor(.white)
            
            List {
                Section(header: Text("Account Settings")) {
                    Text("Change Credentials")
                    
                    Toggle(isOn: $user.notification) {
                        Text("Push Notification")
                    }
                    
                    Text("Sign Out")
                        .foregroundColor(.red)
                }
            }
            
        }
        .padding()
        .background(Color.black)
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(ID: 123, username: "John", password: "password", score: 100, notification: true)
        return ProfileView(user: user)
            .frame(width: 400, height: 600)
    }
}
