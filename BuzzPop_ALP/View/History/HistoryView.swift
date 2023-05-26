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

        LineView(data: scores, title: "History", legend: "score", legendSpecifier: "%.0f")
            .padding()
        
        
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
