//
//  MovieViewModel.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

protocol MoviesViewModelDelegate: class {
    func moviesFetched()
}

final class MoviesViewModel {
    private lazy var movieList: MovieList? = nil
    weak var delegate: MoviesViewModelDelegate?
    lazy var page = 1
    
    init(delegate: MoviesViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getMoviesData(searchTerm: String, page: Int) {
        guard let url = URL(string: BaseURL.getSearchMovieUrl(searchTerm: searchTerm, page: "\(page)")) else { return }
        let resource = Resource<MovieList>(url: url) { (data) in
            let parssedMovies = try? JSONDecoder().decode(MovieList.self, from: data)
            return parssedMovies
        }
        WebService.loadData(resource: resource) { [weak self] (result) in
            if let movies = result {
                self?.movieList = movies
                self?.delegate?.moviesFetched()
            }
        }
    }
    
    func numberOfMovies() -> Int {
        return movieList?.movies.count ?? 0
    }
    
    func getMovies() -> [Movie] {
        return movieList?.movies ?? []
    }
    
    func getMovie(index: Int) -> Movie? {
        return movieList?.movies[index]
    }
}
