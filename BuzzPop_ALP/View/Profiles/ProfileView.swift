//
//  ProfileSummary.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

//profile view
struct ProfileView: View {

    @ObservedObject var user: User
    @Binding var showingEdit: Bool
    
//    @Binding var userForEdit: User


    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Profile")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                //username
                HStack{
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
                
                //score
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.trailing)
                    
                    Text("\(user.score) Points")
                }

                .padding(.bottom)
                .foregroundColor(.white)
                
                
                Form{
                    Section(header: Text("Account Settings")){
                        Text("Change Credentials")
                        
                        // if pressed change
                            .onTapGesture {
                                showingEdit.toggle()
                            }
                            .foregroundColor(.black)

                        
                        Toggle(isOn: $user.notification){
                            Text("Push Notification")
                        }
                        .foregroundColor(.black)

                        
                        Text("Sign Out")
                            .foregroundColor(.red)

                    }
                    .foregroundColor(.white)

                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)

                
                Spacer()
            }
            .background(Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
            .edgesIgnoringSafeArea(.all)
            .padding()
            .padding(8)
    }
    
    
}
//
//struct ProfileSummary_Previews: PreviewProvider {
//    @State var me =  User(ID: 12312, username: "Dylan", password: "password", score: 911, notification: true)
//    
//    static var previews: some View {
//        
//        ProfileView(user: $me, showingEdit: false)
//    }
//}
