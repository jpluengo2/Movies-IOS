//
//  MovieProvider.swift
//  Movies-IOS
//
//  Created by Mananas on 4/12/25.
//

import Foundation

class MovieProvider {
    
    static func findMoviesByTitle(query: String) async -> [Movie] {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(query)&apikey=c802cc1a") else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode(MovieResponse.self, from: data).Search
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    
}
