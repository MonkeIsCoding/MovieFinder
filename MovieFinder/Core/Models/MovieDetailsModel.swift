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
    let posterPath: String
    let backdropPath: String
}

struct MovieDetailsModel: Codable, Identifiable {
    let adult: Bool
    let belongsToCollection: Collection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let posterPath: String
    let id: Int
    let imdbId: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]
    let productionCompanies: [ProdCompanies]
    
    init(adult: Bool, belongsToCollection: Collection, budget: Int, genres: [Genre], homepage: String, posterPath: String, id: Int, imdbId: String, originalTitle: String, overview: String, popularity: Double, releaseDate: String, revenue: Int, runtime: Int, title: String, voteAverage: Double, voteCount: Int, originCountry: [String], productionCompanies: [ProdCompanies]) {
        self.adult = adult
        self.belongsToCollection = belongsToCollection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.posterPath = posterPath
        self.id = id
        self.imdbId = imdbId
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.originCountry = originCountry
        self.productionCompanies = productionCompanies
    }
    
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
    }
}
