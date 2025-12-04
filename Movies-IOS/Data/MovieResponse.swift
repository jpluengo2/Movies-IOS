//
//  MovieResponse.swift
//  Movies-IOS
//
//  Created by Mananas on 4/12/25.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
}

struct Movie: Codable {
    let imdbID: String
    let Title: String
    let Year: String
    let Poster: String
    let Plot: String
    let Runtime: String
    let Director: String
    let Genre: String
    let Country: String
}
