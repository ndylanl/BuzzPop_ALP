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
        self.score = [0, 100, 200, 250, 200, 150, 300]
    }
    
    
    
    func sortScore(){
        score.sort(by: >)
    }
    
    func addScore(score: Int){
        self.score.append(score)
    }

}

