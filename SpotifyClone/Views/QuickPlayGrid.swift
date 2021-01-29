//
//  QuickPlayGrid.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 11/1/20.
//

import SwiftUI

struct QuickPlayGrid: View {
    @State var section: HomeViewSection
    @State var hPadding: CGFloat
    
    let columns = [
        GridItem(.flexible(), spacing: 16, alignment: .leading), GridItem(.flexible(), spacing: 16, alignment: .leading)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HomeSectionHeader(header: section.title, hPadding: hPadding)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(section.albums, id: \.self) { album in
                    QuickPlayCell(album: album)
                }
            }.padding(EdgeInsets(top: 0, leading: hPadding, bottom: 0, trailing: hPadding))
        }
    }
    
    struct QuickPlayCell: View {
        var album: Album
        
        var body: some View {
            HStack {
                AlbumArt
                AlbumInfo
            }
            .frame(height: 60)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
        }
        
        var AlbumArt: some View {
            Image(album.cover)
                .resizable()
                .frame(width: 60, height: 60)
        }
        
        var AlbumInfo: some View {
            HStack() {
                Text(album.title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "shuffle")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                    .imageScale(.small)
            }
        }
    }
}

struct QuickPlayGrid_Previews: PreviewProvider {
    static var previews: some View {
        QuickPlayGrid(section: NetworkManager.shared.fetchHomeScreen().first!, hPadding: 24)
    }
}
