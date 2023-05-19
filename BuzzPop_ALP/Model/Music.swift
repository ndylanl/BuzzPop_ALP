//
//  Music.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

struct Music: Equatable {
    var url: String
    var title: String
    var artist: String
    
    init(url: String, title: String, artist: String) {
        self.url = url
        self.title = title
        self.artist = artist
    }
}
