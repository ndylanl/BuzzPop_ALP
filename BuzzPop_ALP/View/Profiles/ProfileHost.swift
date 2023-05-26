//
//  ProfileHost.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI


//this adds the main display for the profile but also adds the edit button at the top to toggle between modes

struct ProfileHost: View {
    @ObservedObject var user = User(ID: 123, username: "John", password: "password", score: 100, notification: true)
    @State private var showingEdit = false
       
       var body: some View {
           ProfileView(user: user, showingEdit: $showingEdit)
               .sheet(isPresented: $showingEdit) {
                   ProfileEditor(user: user, showingEdit: $showingEdit)
            }
    }
}
