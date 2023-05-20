//
//  ProfileEditor.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

//this display is binded from the profile display and is used to edit the profile.
//It changes all the data from the user profile along with toggling notifications and using different "forms" such as sliders picker and date picker.

struct ProfileEditor: View {
    @State var user: User
    @State var username = ""
    @State var password = ""
    @Binding var showingEdit: Bool


    var body: some View {
        VStack{
            HStack {
                Button("Cancel") {
                    showingEdit.toggle()
                }
            
                Spacer()
                
                Button("Save") {
                    user.username = username
                    user.password = password
                    
                    print(user.username)
                    
                    showingEdit.toggle()
                }
            }
            .padding()
            
            List {
                HStack {
                    Text("Username").bold()
                    Divider()
                    TextField("Username", text: $username)
                }
                
                //
                HStack {
                    Text("Password").bold()
                    Divider()
                    SecureField("Password", text: $password)
                        .padding()
                }
                
            }
        }.onAppear() {
            username = user.username
            password = user.password
        }
    }
    
}

//struct ProfileEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditor(user: User(ID: 12312, username: "Dylan", password: "password", score: 911, notification: true))
//    }
//}
