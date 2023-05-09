//
//  GameControlView.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct GameControlView: View {
    @State var searchText: String
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    if !searchText.isEmpty {
                        Button(action: {
                            self.searchText = ""
                        }) {
                        Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                    }
                }
            }
            .cornerRadius(10)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 1)
            )
            .padding()
            
            HStack{
                Text("Skip(+1s)")
                Spacer()
                Text("Submit")
            }
            .padding([.leading, .trailing])

            
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.init(red: 20/255, green: 25/255, blue: 35/255, opacity: 1.8))
        .foregroundColor(Color.white)
    }
}

struct GameControlView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlView(searchText: "")
    }
}
