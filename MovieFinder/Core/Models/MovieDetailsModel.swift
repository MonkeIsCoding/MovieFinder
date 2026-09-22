//
//  MovieDetailsModel.swift
//  MovieFinder
//
//  Created by Kiko on 21/09/2026.
//

struct Genre: Codable {
    let id: Int
    let name: String
}

struct ProdCompanies: Codable {
    let id: Int
    let name: String
    let logoPath: String
    let originCountry: String
}

struct Collection: Codable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
}

struct MovieDetailsModel: Codable, Identifiable {
    let adult: Bool
    let belongsToCollection: Collection?
    // empty when absent
    let budget: Int
    let genres: [Genre]
    // empty when there is no homepage
    let homepage: String
    let posterPath: String
    let id: Int
    let imdbId: String?
    let originalTitle: String
    let overview: String
    let popularity: Double
    // can be empty for unreleased
    let releaseDate: String
    // empty when absent
    let revenue: Int
    // runtime returns 0 for unreleased or missing
    let runtime: Int
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]
    let productionCompanies: [ProdCompanies]
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case adult
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case posterPath = "poster_path"
        case id
        case imdbId = "imdb_id"
        case originalTitle = "original_title"
        case overview
        case popularity
        case releaseDate = "release_date"
        case revenue
        case runtime
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case productionCompanies = "production_companies"
        case status
    }
}
