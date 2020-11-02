//
//  BaseURL.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

/// Get Absolute API URLs for OMDB
final class BaseURL {
    /// OMDB API Key
    private static let apiKey = "661cf907"
    /// OMDB Base URL
    private static let baseUrl = "http://www.omdbapi.com/"
    
    /// Get Absolute URL for Searching Movie on OMDB
    static func getSearchMovieUrl(searchTerm: String, page: String) -> String {
        return "\(baseUrl)?apikey=\(apiKey)&s=\(searchTerm)&page=\(page)"
    }
    
    /// Get Absolute URL for  Movie Details on OMDB
    static func getMovieDetailsUrl(id: String) -> String {
        return "\(baseUrl)?apikey=\(apiKey)&i=\(id)"
    }
}
