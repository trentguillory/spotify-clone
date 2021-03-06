//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(sections: NetworkManager.shared.fetchHomeScreen())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
