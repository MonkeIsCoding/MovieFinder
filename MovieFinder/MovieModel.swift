struct MovieModel: Codable, Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    init(
        id: Int,
        adult: Bool,
        backdropPath: String,
        genreIds: [Int],
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
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