//
//  SearchViewModel.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

import Foundation

@Observable
class SearchViewModel {
    
    private(set) var movies: [MovieModel] = []
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = TMDBNetworkService()) {
        self.networkService = networkService
    }
    
    func fetchMovies(page: Int) async {
        do {
            movies = try await networkService.fetch(endpoint: TMDB_API.popularMovies(page: page))
        } catch {
            print("Error fetching movies: \(error.localizedDescription)")
        }
    }
}
