//
//  SearchViewModel.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

import Foundation

@Observable
class DetailViewModel {
    
    private(set) var movieDetails: MovieDetailsModel? = nil
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = TMDBNetworkService()) {
        self.networkService = networkService
    }
    
    func fetchMovieDetails(id movieId: Int) async {
        do {
            movieDetails = try await networkService.fetch(endpoint: TMDB_API.movieDetails(id: "\(movieId)"))
        } catch {
            print("Error fetching movies: \(error.localizedDescription)")
        }
    }
}
