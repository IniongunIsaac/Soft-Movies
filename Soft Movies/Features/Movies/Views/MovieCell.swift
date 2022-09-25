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
    }
    
}
