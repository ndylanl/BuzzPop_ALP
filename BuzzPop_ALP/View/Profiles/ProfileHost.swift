//
//  ProfileHost.swift
//  0706012110058-NicholasDylan-Lienardi-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI


//this adds the main display for the profile but also adds the edit button at the top to toggle between modes

//struct ProfileHost: View {
//    @Environment(\.editMode) var editMode
//    @EnvironmentObject var modelData: ModelData
//    @State private var draftProfile = Profile.default
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            HStack {
//                //this adds a cancel feature to not commit any changes made.
//                if editMode?.wrappedValue == .active {
//                    Button("Cancel", role: .cancel) {
//                        draftProfile = modelData.profile
//                        editMode?.animation().wrappedValue = .inactive
//                    }
//                }
//                Spacer()
//                EditButton()
//            }
//
//            //used to update the model data
//            if editMode?.wrappedValue == .inactive {
//                ProfileSummary(profile: modelData.profile)
//            } else {
//                ProfileEditor(profile: $draftProfile)
//                    .onAppear {
//                        draftProfile = modelData.profile
//                    }
//                    .onDisappear {
//                        modelData.profile = draftProfile
//                    }
//            }
//        }
//        .padding()
//    }
//}
//
//struct ProfileHost_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHost()
//            .environmentObject(ModelData())
//    }
//}
