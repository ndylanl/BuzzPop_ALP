//
//  Onboarding.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 05/06/23.
//

import SwiftUI

struct Onboarding: View {
    // MARK: - Property
    
    @AppStorage("onboarding") var isOnboardingViewActivity: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack{
            Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                
                // MARK: - HEADER
                
                Spacer()
                VStack(spacing: 0) {
                    Text("""
                        BuzzPop
                        """)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    Text("""
                        Click. Listen. and Guess.
                        """)
                    .font(.title3)
                    .fontWeight (.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                
                // MARK: - CENTER
                
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    }
                    Image("Skrinsot")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                // MARK: - FOOTER
                
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Let's Play!")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    HStack{
                        Capsule()
                            .fill(.green)
                            .frame(width: 80)
                        Spacer()
                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(.green)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .heavy))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingViewActivity = true
                        }
                        Spacer()
                    }
                }
                .frame(height: 80, alignment: .center)
                .padding()
                
            }
        }
    }
}

// MARK: - PREVIEW
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
