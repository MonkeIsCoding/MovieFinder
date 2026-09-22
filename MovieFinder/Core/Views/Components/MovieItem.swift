//
//  MovieList.swift
//  MovieFinder
//
//  Created by Kiko on 22/09/2026.
//

import SwiftUI

struct MovieItem: View {
    
    var movie: MovieModel = .mock
    @Binding var isFavourite: Bool
    
    var body: some View {
            HStack {
                if let url = movie.backdropPath {
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle()
                            .foregroundStyle(Color.gray.opacity(0.7))
                            .overlay {
                                Image(systemName: "questionmark")
                                    .opacity(0.7)
                            }
                    }
                    .frame(width: 55, height: 80)
                    .cornerRadius(8)
                    .padding(.trailing, 6)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .fontWeight(.medium)
                        .font(.system(size: 18, design: .serif))
                    Text(movie.releaseDate.giveYear())
                        .font(.system(size: 15, design: .serif))
                        .foregroundStyle(.primary.opacity(0.7))
                }
                Spacer()
                // turn this into a modifier
                Button {
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .font(.title2)
                        .padding(.trailing, 10)
                        .foregroundStyle(isFavourite ? .red : .primary)
                }
            }
            .padding(.horizontal)
            .background {
                // bug this is toggling when clicking heart as well
                NavigationLink(destination: DetailView()) {}
                    .opacity(0)
            }
    }
}

#Preview {
    @Previewable @State var toggle: Bool = false
    
    List {
        Section {
            MovieItem(isFavourite: $toggle)
        }
        .padding(.vertical, 8)
        .listRowInsets(.init())
    }
    .listStyle(.plain)
}
