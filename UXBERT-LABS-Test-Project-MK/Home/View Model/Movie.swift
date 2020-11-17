//
//  Movie.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

struct MovieList: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let type: String
    let poster: String
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
        case id = "imdbID"
    }
}
