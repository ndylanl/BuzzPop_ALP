//
//  Game.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

class Game: ObservableObject {
    @Published var listMusic: [Music]
    @Published var duration: Int
    @Published var pointsAwarded: Int
    
    init(listMusic: [Music], duration: Int, pointsAwarded: Int) {
        self.listMusic = listMusic
        self.duration = duration
        self.pointsAwarded = pointsAwarded
    }
    
    func increaseDuration(){
        
    }
    
    func awardPoints(){
        
    }
    
    func guessAnswer(){
        
    }
    
    func initializeMusic(){
        
    }
}
