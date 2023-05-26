//
//  HistoryView.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 23/05/23.
//

import SwiftUI
import SwiftUICharts

struct HistoryView: View {
    @ObservedObject var viewModel = History()
    
    
    var body: some View {
        let scores = viewModel.score.map {Double($0)}
        let customdarkstyle = ChartStyle(backgroundColor: Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99), accentColor: Color(red: 232/255, green: 199/255, blue: 137/255), gradientColor: GradientColor(start: Color(red: 232/255, green: 199/255, blue: 137/255), end: .green), textColor: Color(red: 4/255, green: 84/255, blue: 83/255), legendTextColor: Color(red: 232/255, green: 199/255, blue: 137/255), dropShadowColor: .white)

        VStack{
            LineView(data: scores, title: "History", legend: "score", style: customdarkstyle, legendSpecifier: "%.0f")
                .padding()
            
        }
        .background(Color(red: 20/255, green: 25/255, blue: 35/255, opacity: 0.99))
        
        
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
