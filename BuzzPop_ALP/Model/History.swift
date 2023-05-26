//
//  History.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 23/05/23.
//

import Foundation

class History: ObservableObject{
    @Published var score: [Int]
    
    init() {
        self.score = [
        300, 180, 230, 400, 500, 120, 250, 120
        ]
    }
    
    
    
    func sortScore(){
        score.sort(by: >)
    }

}

