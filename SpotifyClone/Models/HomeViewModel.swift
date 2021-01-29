//
//  HomeScreenModel.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import Foundation

struct HomeViewSection {
    var order: Int
    var title: String
    var albums: [Album]
    var type: HomeSectionType
}

enum HomeSectionType {
    case albumScroll, quickShuffle
}
