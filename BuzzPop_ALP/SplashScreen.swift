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
    
    var body: some View {
        VStack {

                Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.init(red: 0, green: 85/255, blue: 83/255))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change duration time as per your requirement
                                    withAnimation(.easeOut(duration: 1.0)) {
                                        
                                    }
                                }
                            }
            
        }
    }
}
