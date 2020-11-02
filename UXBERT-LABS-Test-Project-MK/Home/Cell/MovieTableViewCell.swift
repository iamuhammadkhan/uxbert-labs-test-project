//
//  MovieTableViewCell.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit
import SDWebImage

final class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text?.removeAll()
        posterImageView.image = UIImage()
    }
    
    /// Configure Cell with Model Class Data
    func configureCell(title: String, imageUrl: String) {
        titleLabel.text = title
        if let url = URL(string: imageUrl) {
            posterImageView.sd_setImage(with: url)
        }
    }
}
