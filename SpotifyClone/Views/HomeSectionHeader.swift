//
//  HomeSectionHeader.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 11/1/20.
//

import SwiftUI

struct HomeSectionHeader: View {
    @State var header: String
    @State var hPadding: CGFloat
    
    var body: some View {
        Text(header)
            .font(.title)
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 0, leading: hPadding, bottom: 0, trailing: 0))
    }
}

struct HomeSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeSectionHeader(header: "Recently Played", hPadding: 24)
    }
}
