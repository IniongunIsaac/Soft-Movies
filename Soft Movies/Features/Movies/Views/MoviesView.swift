//
//  MoviesView.swift
//  Soft Movies
//
//  Created by Isaac Iniongun on 25/09/2022.
//

import UIKit
import DZNEmptyDataSet
import AttributedStringBuilder

final class MoviesView: BaseView {
    
    var viewModel: IMoviesViewModel!
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                       subitem: item,
                                                       count: 2)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }()
    private lazy var moviesCollectionView = AppCollectionView(cells: [MovieCell.self], layout: layout, delegate: self, dataSource: self)

    override func setup() {
        super.setup()
        with(moviesCollectionView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 0))
            $0.emptyDataSetSource = self
            $0.emptyDataSetDelegate = self
        }
    }
    
    func reloadMovies() {
        with(moviesCollectionView) {
            $0.reloadData()
            $0.reloadEmptyDataSet()
        }
    }

}

extension MoviesView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.movies[indexPath.row]
        return with(collectionView.deque(cell: MovieCell.self, at: indexPath)) {
            $0.configure(movie: movie)
        }
    }
    
}

extension MoviesView: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet _: UIScrollView) -> UIImage? {
        .emptyIcon.withTintColor(.secondaryLabel)
    }

    func description(forEmptyDataSet _: UIScrollView) -> NSAttributedString? {
        AttributedStringBuilder()
            .text("Movies will appear here!", attributes: [.font(.avenirRegular(16)), .textColor(.secondaryLabel), .alignment(.center)])
            .attributedString
    }

    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        -70
    }

    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        viewModel.movies.isEmpty
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        AttributedStringBuilder()
            .text("Refresh", attributes: [.font(.avenirBold(18)), .textColor(.primaryTextColor), .underline(true), .underlineColor(.primaryTextColor)])
            .attributedString
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
        viewModel.getMovies()
    }
}
