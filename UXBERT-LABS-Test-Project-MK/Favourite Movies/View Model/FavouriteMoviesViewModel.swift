//
//  FavouriteMoviesViewModel.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

protocol FavouriteMoviesViewModelDelegate: class {
    func favouriteMoviesFetched()
}

final class FavouriteMoviesViewModel {
    private lazy var movies = [MovieDetails]()
    private weak var delegate: FavouriteMoviesViewModelDelegate?
    
    init(delegate: FavouriteMoviesViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getMovieDetailsData(iDs: [String]) {
        for id in iDs {
            guard let url = URL(string: "\(BaseURL.getMovieDetailsUrl(id: id))") else { return }
            let resource = Resource<MovieDetails>(url: url, httpMethod: .get) { (data) in
                let parssedMovie = try? JSONDecoder().decode(MovieDetails.self, from: data)
                return parssedMovie
            }
            WebService.loadData(resource: resource) { [weak self] (data) in
                if let movie = data {
                    self?.movies.insert(movie, at: 0)
                    self?.delegate?.favouriteMoviesFetched()
                }
            }
        }
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func getMovies() -> [MovieDetails] {
        return movies
    }
    
    func getMovie(index: Int) -> MovieDetails? {
        return movies[index]
    }
}
