//
//  Album.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import Foundation
import SwiftUI

struct Album: Hashable {
    static func == (lhs: Album, rhs: Album) -> Bool {
        lhs.title == rhs.title && lhs.artist == rhs.artist
    }
    
    var cover: String
    var title: String
    var artist: String
    var songs: [Song]
}
