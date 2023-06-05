//
//  HistoryView.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 23/05/23.
//

import SwiftUI
import SwiftUICharts

struct GameItem: Identifiable {
    let id = UUID()
    let index: Int
    let score: Int
}

struct HistoryView: View {
    @ObservedObject var history: History
    
    
    var body: some View {
        let score = history.score
        
        let streak = history.streak
        
        
        let scores = score.map {Double($0)}
        let customdarkstyle = ChartStyle(backgroundColor: Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99), accentColor: Color(red: 232/255, green: 199/255, blue: 137/255), gradientColor: GradientColor(start: .green, end: Color(red: 232/255, green: 199/255, blue: 137/255)), textColor: Color(red: 232/255, green: 199/255, blue: 137/255), legendTextColor: Color(red: 232/255, green: 199/255, blue: 137/255), dropShadowColor: .black)
        
        VStack{
            LineView(data: scores, title: "History", style: customdarkstyle, legendSpecifier: "%.0f")
                .preferredColorScheme(.dark)
                .padding()
            
           

            

            List {
                ForEach(Array(score.enumerated().reversed()).map { GameItem(index: $0.offset, score: $0.element) }) { gameItem in
                    HStack {
                        Text("Game \(gameItem.index + 1)")
                            .padding(.horizontal)
                        Text("Streak \(streak[gameItem.index])")
                            .padding(.horizontal)
                        Spacer()
                        Text("Score \(gameItem.score)")
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .padding(.vertical, 10)




            
            
            
            
        }
        .background(Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
        
        
    }
}



//struct HistoryView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        HistoryView()
//    }
//}
