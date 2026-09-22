//
//  SearchView.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

import SwiftUI

struct DiscoverView: View {
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(searchText: $search)
                
                List {
                    Section {
//                        MovieItem()
                    }
                    .padding(.vertical, 8)
                    .listRowInsets(.init())
                }
                .listStyle(.plain)
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverView()
}
