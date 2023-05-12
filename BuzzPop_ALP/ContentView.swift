//
//  ContentView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashScreenShown = true

    var body: some View {
//        Group {
//            if isSplashScreenShown {
//                SplashScreen()
//                    .transition(.opacity) // Add fade transition animation
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change duration time as per your requirement
//                            withAnimation(.easeOut(duration: 1.5)) {
//                                self.isSplashScreenShown = false
//                            }
//                        }
//                    }
//            } else {
//                GameView()
//            }
//        }
        GameView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
