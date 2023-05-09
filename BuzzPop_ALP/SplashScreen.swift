//
//  SplashScreen.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}


struct SplashScreen: View {
    @State private var isActive = true
    
    var body: some View {
        VStack {
            if self.isActive {
                GameView()
            } else {
                Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.init(red: 0, green: 85/255, blue: 83/255))
            }
        }
    }
}
