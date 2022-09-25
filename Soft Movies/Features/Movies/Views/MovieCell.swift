//
//  MovieCell.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import UIKit

final class MovieCell: BaseCollectionViewCell {
    
    private let posterImageView = UIImageView(image: nil)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    override func setup() {
        super.setup()
        with(posterImageView) {
            _addSubview($0)
            $0.fillSuperview()
        }
    }
    
    func configure(movie: Movie) {
        posterImageView.setImageFromURL(url: movie.poster, placeholderImage: .moviePlaceholderIcon.withTintColor(.tertiaryLabel))
    }
}
