//
//  History.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 23/05/23.
//

import Foundation

class History{
    @Published var score: [Int]
    
    init() {
        self.score = [
        123753, 138592, 284123, 193012, 19301, 25817, 124893, 195204, 120478, 816491
        ]
    }
    
    
    
    func sortScore(){
        score.sort(by: >)
    }

}

