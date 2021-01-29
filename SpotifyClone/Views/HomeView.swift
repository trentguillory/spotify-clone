//
//  HomeView.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import SwiftUI

struct HomeView: View {
    @State var sections: [HomeViewSection]
    @State var hPadding: CGFloat = 24
    @State var vPadding: CGFloat = 46
    @State var scrollViewOffset: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                HomeHeaderView(hPadding: hPadding,
                               vPadding: geometry.safeAreaInsets.top + hPadding,
                               scrollOffset: $scrollViewOffset)
                ScrollView {
                    OffsetReader()
                    
                    LazyVStack(spacing: vPadding) {
                        TopSpacer(topSpace: vPadding)
                        ForEach(sections, id: \.order) { section in
                            cellView(section: section)
                        }
                    }
                }
                .coordinateSpace(name: "scrollView")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: { offset in
                    scrollViewOffset = offset
                })
            }.edgesIgnoringSafeArea(.top)
        }
    }
    
    struct TopSpacer: View {
        var topSpace: CGFloat
        
        var body: some View {
            HStack {}
                .frame(width: 50, height: topSpace)
        }
    }
    
    struct OffsetReader: View {
        var body: some View {
            Color.clear
                .background(
                    GeometryReader { geo in
                        Color.clear.preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: geo.frame(in: .named("scrollView")).minY
                        )
                    }
                ).frame(height: 0)
        }
    }
    
    func cellView(section: HomeViewSection) -> AnyView {
        switch section.type {
        case .albumScroll:
            return AnyView(AlbumScroll(section: section, hPadding: 24))
        case .quickShuffle:
            return AnyView(QuickPlayGrid(section: section, hPadding: 24))
        }
    }
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(sections: NetworkManager.shared.fetchHomeScreen())
            .preferredColorScheme(.dark)
    }
}
