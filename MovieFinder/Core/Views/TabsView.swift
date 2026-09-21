//
//  TabsView.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            Tab("Discover", systemImage: "magnifyingglass") {
                DiscoverView()
            }
            Tab("Favourites", systemImage: "star") {
                FavouritesView()
            }
        }
    }
}

#Preview {
    TabsView()
}
