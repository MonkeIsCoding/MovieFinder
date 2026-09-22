//
//  FavouritesView.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

import SwiftUI

struct FavouritesView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 35)
                    .cornerRadius(8)
                    .foregroundStyle(.gray.opacity(0.2))
                    .overlay {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $search)
                            Button {
                                search = ""
                            } label: {
                                Image(systemName: "multiply.circle")
                            }
                            .tint(.primary)
                        }
                        .padding(.horizontal, 8)
                    }
                    .padding(.horizontal)
                
                List {
                    Section {
                        movieItem
                            .background {
                                NavigationLink(destination: DetailView()) {}
                                    .opacity(0)
                            }
                    }
                    .padding(.vertical, 8)
                    .listRowInsets(.init())
                }
                .listStyle(.plain)
            }
            .navigationTitle("Favourites")
        }
    }
    
    var movieItem: some View {
        HStack {
            Rectangle()
                .frame(width: 45, height: 70)
                .cornerRadius(8)
                .padding(.trailing, 6)
            // Image
            VStack {
                Text("Title")
                Text("Year")
                    .fontWeight(.light)
                    .font(.callout)
            }
            Spacer()
            Button {
                // favourite manager .addToFavourites
            } label: {
                Image(systemName: "heart")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    FavouritesView()
}
