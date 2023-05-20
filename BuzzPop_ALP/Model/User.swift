//
//  User.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

class User: ObservableObject {
    
    @Published var ID: Int
    @Published var username: String
    @Published var password: String
    @Published var score: Int
    @Published var notification: Bool

//    @Published var History: Int

    
    init(ID: Int, username: String, password: String, score: Int, notification: Bool) {
        self.ID = ID
        self.username = username
        self.password = password
        self.score = score
        self.notification = notification
    }
}
