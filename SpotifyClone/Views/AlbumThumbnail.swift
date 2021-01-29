//
//  AlbumThumbnail.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import SwiftUI

struct AlbumThumbnail: View {
    @State var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image(album.name)
            Image(album.cover)
                .resizable()
                .frame(width: 130, height: 130)
            Text(album.title)
                .font(.caption)
        }
    }
}

struct AlbumThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        AlbumThumbnail(album: NetworkManager.shared.fetchHomeScreen().first!.albums.first!)
    }
}
