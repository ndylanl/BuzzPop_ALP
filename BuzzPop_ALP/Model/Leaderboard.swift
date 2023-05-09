//
//  Leaderboard.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

class Leaderboard: ObservableObject {
    @Published var list: [User]
    
    init(list: [User]) {
        self.list = list
    }
    
}
