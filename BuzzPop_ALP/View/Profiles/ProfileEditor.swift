//
//  ProfileEditor.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

//this display is binded from the profile display and is used to edit the profile.
//It changes all the data from the user profile along with toggling notifications and using different "forms" such as sliders picker and date picker.
//struct ProfileEditor: View {
//    @Binding var profile: Profile
//    
//    //settgin calendar boundaries
//    var dateRange: ClosedRange<Date> {
//        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
//        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
//        return min...max
//    }
//    
//    var body: some View {
//        List {
//            HStack {
//                Text("Username").bold()
//                Divider()
//                TextField("Username", text: $profile.username)
//            }
//            
//            //toggle button
//            Toggle(isOn: $profile.prefersNotifications) {
//                Text("Enable Notifications").bold()
//            }
//            
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Seasonal Photo").bold()
//                
//                //slider using for loop.
//                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
//                    ForEach(Profile.Season.allCases) { season in
//                        Text(season.rawValue).tag(season)
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
//
//            //date and calendar picker.
//            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
//                Text("Goal Date").bold()
//            }
//        }
//    }
//}
//
//struct ProfileEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditor(profile: .constant(.default))
//    }
//}
