//
//  MoviesController.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit
import SDWebImage

protocol MoviesDelegate: class {
    func movieSelected(_ movie: Movie, on controller: MoviesController)
}

class MoviesController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    /*MARK: ++++++++++++++++++++ PROPERTIES ++++++++++++++++++++*/
    
    public weak var collectionView: UICollectionView!
    private weak var delegate: MoviesDelegate!
    
    public var category: MovieCategory? = nil
    private var movies: [Movie] = []
    
    /*MARK: ++++++++++++++++++++ CONSTRUCTOR ++++++++++++++++++++*/
    
    init(with delegate: MoviesDelegate, collectionView: UICollectionView) {
        super.init()
        self.delegate = delegate
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    /*MARK: ++++++++++++++++++++ METHODS ++++++++++++++++++++*/
    
    public func updateMovies(_ movies: [Movie]){
        self.movies = movies
        reloadData()
    }
    
    public func reloadData(){
        self.collectionView.reloadData()
    }
    
    public func isEmpty() -> Bool{
        return movies.isEmpty
    }
    
    /*MARK: ++++++++++++++++++++ EVENTS ++++++++++++++++++++*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableHeader(.Header, for: indexPath) as! HeaderView
        view.title.text = category?.asString()
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(.Movie, for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.rating.label.text = movie.ratingFormatted
        cell.title.text = movie.title
        cell.date.text = movie.date?.toFormat("dd MMMM yyyy")
        cell.poster.sd_setImage(with: movie.posterUrl, placeholderImage: nil)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(category != nil){
            return CGSize(width: collectionView.frame.width - Styles.Margin.Margin2x, height: 80)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        delegate.movieSelected(movie, on: self)
    }
}
