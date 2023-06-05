//
//  MacHistoryView.swift
//  BuzzPopMac
//
//  Created by Rifqie Tilqa Reamizard on 06/06/23.
//

import SwiftUI
import Charts

struct GameItem: Identifiable {
    let id = UUID()
    let index: Int
    let score: Int
}

struct MacHistoryView: View {
    @ObservedObject var history: History
    
    var body: some View {
        let score = history.score
        
        let streak = history.streak
        
        let lineColor: Color = .green
        let lineWidth: CGFloat = 2.0
        let padding: CGFloat = 40.0

        
        HStack{
            GeometryReader { geometry in
                ZStack {
                    // Background
                    Color(red: 240/255, green: 240/255, blue: 240/255).ignoresSafeArea(.all)
                    
                    // Chart
                    Path { path in
                        let maxY = score.max() ?? 0
                        let minY = score.min() ?? 0
                        let rangeY = maxY - minY
                        let dataCount = score.count
                        
                        for index in 0..<dataCount {
                            let x = (geometry.size.width - padding * 2) / CGFloat(dataCount - 1) * CGFloat(index) + padding
                            let y = geometry.size.height - (geometry.size.height - padding * 2) * CGFloat((score[index] - minY) / rangeY) - padding
                            
                            if index == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }
                    }
                    .stroke(lineColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))

                    // Labels
                    VStack {
                        Spacer()
                        Text("\(Int(score.max() ?? 0))")
                            .font(.caption)
                        Spacer()
                        Text("\(Int(score.min() ?? 0))")
                            .font(.caption)
                        Spacer()
                    }
                    .padding(.horizontal, padding / 2)
                    .frame(width: padding)
                }
            }
            .padding()
            .padding(.all, 40)
            
            
            
            VStack{
                if(score.count != 1){
                    List {
                        ForEach(Array(score.enumerated().reversed()).dropLast().map { GameItem(index: $0.offset, score: $0.element) }) { gameItem in
                            HStack {
                                Text("Game \(gameItem.index)")
                                    .padding(.horizontal)
                                Text("Streak \(streak[gameItem.index])")
                                    .padding(.horizontal)
                                Spacer()
                                Text("Score \(gameItem.score)")
                                    .padding(.horizontal)
                            }
                            .padding()
                        }
                        .padding()
                        .padding(.vertical, 4)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .padding(.top, 20)
                }else{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Please play a game first to view your history")
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
            }
            .background(Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
        }
        
        
        
        
        
    }
}

//struct MacHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MacHistoryView()
//    }
//}
