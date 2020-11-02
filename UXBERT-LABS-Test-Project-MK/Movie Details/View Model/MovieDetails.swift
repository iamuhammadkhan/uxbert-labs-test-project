//
//  MovieDetails.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

struct MovieDetails: Decodable {
    let title: String
    let released: String
    let poster: String
    let rating: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case rating = "imdbRating"
        case poster = "Poster"
        case year = "Year"
    }
}
