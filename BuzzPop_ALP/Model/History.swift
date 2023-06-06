//
//  History.swift
//  BuzzPop_ALP
//
//  Created by Rifqie Tilqa Reamizard on 23/05/23.
//

import Foundation

class History: ObservableObject{
    @Published var score: [Int]
    @Published var streak: [Int]
        
    init() {
        self.score = [0, 100, 200, 300]
        self.streak = [0, 1, 2, 3]
    }
    
    func addScore(score: Int){
        self.score.append(score)
    }
    
    func addStreak(streak: Int){
        self.streak.append(streak)
    }

}

