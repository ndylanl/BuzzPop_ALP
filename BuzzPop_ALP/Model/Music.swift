//
//  Music.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

class Music: ObservableObject {
    @Published var ID: Int
    @Published var url: String
    @Published var title: String
    @Published var artist: String
    
    init(ID: Int, url: String, title: String, artist: String) {
        self.ID = ID
        self.url = url
        self.title = title
        self.artist = artist
    }
}
