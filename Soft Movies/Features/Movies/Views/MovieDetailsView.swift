//
//  MovieDetailsView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import UIKit
import AttributedStringBuilder

final class MovieDetailsView: BaseScrollView {
    
    var viewModel: IMoviesViewModel!
    private let posterHeight = UIScreen.main.bounds.height * 0.4
    
    private let backImageView = UIImageView(image: .arrowLeftIcon, contentMode: .scaleAspectFit, size: 30)
    private lazy var backNavView = UIView(subviews: [backImageView], size: 40, backgroundColor: .white, radius: 20)
    private lazy var posterContainerView = UIView(subviews: [posterImageView, backNavView], height: posterHeight, backgroundColor: .black)
    private let posterImageView = UIImageView(image: .moviePlaceholderIcon, contentMode: .scaleAspectFit)
    private let titleLabel = UILabel(text: "", font: .avenirBold(22), alignment: .left)
    private let yearLabel = UILabel(text: "", alignment: .left)
    private let ratedLabel = UILabel(text: "", alignment: .left)
    private let runtimeLabel = UILabel(text: "", alignment: .left)
    private let emptyView = UIView(height: 5)
    private lazy var yearStackView = HStackView(subviews: [yearLabel, ratedLabel, runtimeLabel, emptyView], spacing: 15, alignment: .center)
    private let otherDetailsLabel = UILabel(text: "", numberOfLines: 0, alignment: .left)
    private lazy var contentStackView = VStackView(subviews: [titleLabel, yearStackView, otherDetailsLabel], spacing: 20)

    override func setup() {
        super.setup()
        _addSubviews(posterContainerView, contentStackView)
        posterContainerView.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
        posterImageView.fillSuperview()
        backNavView.anchor(top: posterContainerView.topAnchor, leading: posterContainerView.leadingAnchor, padding: ._init(top: 10, left: 10))
        backImageView.centerInSuperview()
        contentStackView.anchor(top: posterContainerView.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor, padding: ._init(allEdges: 20))
        
        backNavView.animateViewOnTapGesture { [weak self] in
            self?.viewModel.coordinatorDelegate?.navigate(to: .back)
        }
    }
    
    func showDetails() {
        guard let movieDetails = viewModel.movieDetails else { return }
        with(movieDetails) {
            posterImageView.setImageFromURL(url: $0.poster.orNA)
            titleLabel.text = $0.title
            yearLabel.text = $0.year
            ratedLabel.text = $0.rated
            runtimeLabel.text = $0.runtime
            otherDetailsLabel.attributedText = AttributedStringBuilder()
                .text("Country: \($0.country.orNA)")
                .newlines(2)
                .text("Language: \($0.language.orNA)")
                .newlines(2)
                .text("Released: \($0.released.orNA)")
                .newlines(2)
                .text("Director: \($0.director.orNA)")
                .newlines(2)
                .text("Genre: \($0.genre.orNA)")
                .newlines(2)
                .text("Writer: \($0.writer.orNA)")
                .newlines(2)
                .text("Actors: \($0.actors.orNA)")
                .newlines(2)
                .text("Plot: \($0.plot.orNA)")
                .newlines(2)
                .text("Awards: \($0.awards.orNA)")
                .newlines(2)
                .text("Ratings: \($0.ratingsText)")
                .newlines(2)
                .text("Metascore: \($0.metascore.orNA)")
                .newlines(2)
                .text("IMDB Rating: \($0.imdbRating.orNA)")
                .newlines(2)
                .text("IMDB Votes: \($0.imdbVotes.orNA)")
                .newlines(2)
                .text("IMDB ID: \($0.imdbID)")
                .newlines(2)
                .text("Type: \($0.type.orNA.capitalized)")
                .newlines(2)
                .text("Box Office: \($0.boxOffice.orNA)")
                .newlines(2)
                .text("Production: \($0.production.orNA)")
                .newlines(2)
                .text("Website: \($0.website.orNA)")
                .attributedString
        }
    }

}
