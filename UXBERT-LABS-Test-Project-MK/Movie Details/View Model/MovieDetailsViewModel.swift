//
//  MovieDetailsViewModel.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

protocol MovieDetailsViewModelDelegate: class {
    func movieDetailsFetched(movieDetails: MovieDetails)
}

final class MovieDetailsViewModel {
    private weak var delegate: MovieDetailsViewModelDelegate?
    
    init(delegate: MovieDetailsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getMovieDetailsData(movieId: String) {
        guard let url = URL(string: "\(BaseURL.getMovieDetailsUrl(id: movieId))") else { return }
        let resource = Resource<MovieDetails>(url: url, httpMethod: .get) { (data) in
            let parssedMovie = try? JSONDecoder().decode(MovieDetails.self, from: data)
            return parssedMovie
        }
        WebService.loadData(resource: resource) { [weak self] (data) in
            if let movie = data {
                self?.delegate?.movieDetailsFetched(movieDetails: movie)
            }
        }
    }
}
