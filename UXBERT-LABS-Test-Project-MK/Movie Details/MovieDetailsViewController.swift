//
//  MovieDetailsViewController.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit

final class MovieDetailsViewController: UIViewController {

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieReleaseDate: UILabel!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var movieYear: UILabel!
    
    private lazy var movieDetailsViewModel: MovieDetailsViewModel? = nil
    lazy var movieId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        movieDetailsViewModel = MovieDetailsViewModel(delegate: self)
        guard !movieId.isEmpty else { return }
        movieDetailsViewModel?.getMovieDetailsData(movieId: movieId)
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Movie Details"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(favouriteButtonTapped))
        let shareButton = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItems = [addButton, shareButton]
    }
    
    @objc private func shareButtonTapped(_ sender: UIBarButtonItem) {
        if let image = posterImageView.image { shareActivity(with: image) }
    }
    
    @objc private func favouriteButtonTapped(_ sender: UIBarButtonItem) {
        var favouriteMovieIDs = UserDefaults.standard.array(forKey: "favouriteMovieIDs") as? [String] ?? []
        if favouriteMovieIDs.contains(movieId) { return }
        favouriteMovieIDs.append(movieId)
        UserDefaults.standard.set(favouriteMovieIDs, forKey: "favouriteMovieIDs")
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func movieDetailsFetched(movieDetails: MovieDetails) {
        if let url = URL(string: movieDetails.poster) {
            posterImageView.sd_setImage(with: url)
        }
        titleLabel.text = movieDetails.title
        movieReleaseDate.text = "Released On: \(movieDetails.released)"
        movieRating.text = "IMDB Rating: \(movieDetails.rating)"
        movieYear.text = "Movie Year: \(movieDetails.year)"
    }
}
