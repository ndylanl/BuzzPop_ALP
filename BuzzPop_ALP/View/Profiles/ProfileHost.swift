//
//  ProfileHost.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI


//this adds the main display for the profile but also adds the edit button at the top to toggle between modes

struct ProfileHost: View {
    @ObservedObject var user: User
    @State private var showingEdit = false
       
       var body: some View {
           ProfileView(user: user, showingEdit: $showingEdit)
               .sheet(isPresented: $showingEdit) {
                   ProfileEditor(user: user, showingEdit: $showingEdit)
               }
               .background(Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))

           
    }
}
