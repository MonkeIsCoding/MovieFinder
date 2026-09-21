//
//  APILayer.swift
//  MovieFinder
//
//  Created by Kiko on 20/09/2026.
//

import Foundation

let API_KEY: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTU0ZjM2ZDQwNTViY2MzYjU0MzAxZGFmNjY1ODgyOSIsIm5iZiI6MTc4OTk0MTg0MS45MjMsInN1YiI6IjZhYjA1ODUxMTExMDBlNDc0YzllZGFkNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0BmtzYOb--kWDAI5Tzd6P1nm9ejbAMjLkR_oXCJL3ns"

enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
    case UPDATE
}

protocol API {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: HTTPMethod { get }
}

extension API {
    func buildURLComponents() -> URLComponents {
        var components = URLComponents()
        components.host = baseURL
        components.path = path
        components.queryItems = parameters
        return components
    }
}

enum TMDB_API: API {
    case popularMovies(page: Int)
    case movieDetails(id: String)
    
    var baseURL: String {
        "https://api.themoviedb.org/3/"
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            "movies/popular"
        case .movieDetails(let id):
            "movie/\(id)"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .popularMovies(let page):
            [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        case .movieDetails:
            [
                URLQueryItem(name: "language", value: "en-US")
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .popularMovies, .movieDetails:
                .GET
        }
    }
}

protocol NetworkService {
    func fetch<T: Codable>(endpoint: any API) async throws -> T
}

enum NetworkServiceError: Error {
    case invalidURL
    case invalidResponse
    case clientError(Int)
    case serverError(Int)
    case unexpectedStatusCode(Int)
}

final class TMDBNetworkService: NetworkService {
    
    let session: URLSession
    let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetch<T: Codable>(endpoint: any API) async throws -> T {
        let components = endpoint.buildURLComponents()
        guard let url = components.url else {
            throw NetworkServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(API_KEY)"
        ]
        
        let(data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.invalidResponse
        }
        
        let statusCode = httpResponse.statusCode
        switch statusCode {
        case 200...299:
            return try decoder.decode(T.self, from: data)
        case 400...499:
            throw NetworkServiceError.clientError(statusCode)
        case 500...599:
            throw NetworkServiceError.serverError(statusCode)
        default:
            throw NetworkServiceError.unexpectedStatusCode(statusCode)
        }
    }
}
