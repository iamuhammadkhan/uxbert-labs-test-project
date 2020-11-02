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
    
    lazy var movieId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func getMovieDetailsData() {
        guard !movieId.isEmpty else { return }
        guard let url = URL(string: "\(BaseURL.getMovieDetailsUrl(id: movieId))") else { return }
        
    }
}
