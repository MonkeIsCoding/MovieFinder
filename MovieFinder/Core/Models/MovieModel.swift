//
//  MovieModel.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

struct MovieModel: Codable, Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieModel {
    static let mock: MovieModel =
        MovieModel(
            id: 640146,
            adult: false,
            backdropPath: "/gMJngTNfaqCSCqGD4y8lVMZXKDn.jpg",
            genreIds: [28,12,878],
            overview: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
            popularity: 8567.865,
            posterPath: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
            releaseDate: "2023-02-15",
            title: "Ant-Man and the Wasp: Quantumania",
            voteAverage: 6.5,
            voteCount: 1886
        )
}

extension String {
    func giveYear() -> String {
        self.split(separator: "-").first.map(String.init) ?? ""
    }
}
