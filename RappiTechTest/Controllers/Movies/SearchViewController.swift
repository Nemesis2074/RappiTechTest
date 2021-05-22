//
//  SearchViewController.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import UIKit
import Toast_Swift

class SearchViewController: UIViewController, UISearchBarDelegate, MoviesDelegate {

    /*MARK: ++++++++++++++++++++ PROPERTIES ++++++++++++++++++++*/
    
    @IBOutlet weak var containerView: XibView!
    
    private var detailView: SearchScreenView{
        return containerView.contentView as! SearchScreenView
    }
    
    private lazy var listController: MoviesController = {
        return MoviesController(with: self,
                                collectionView: detailView.collectionView)
    }()
    
    /*MARK: ++++++++++++++++++++ METHODS ++++++++++++++++++++*/
    
    private func searchMovies(by query:String){
        RepositoryManager.searchMovies(query: query) { (result) in
            switch(result){
                case .success(let movies):
                    self.listController.updateMovies(movies)
                
                case .failure(let error):
                    self.view.makeToast(error.status.toString())
            }
        }
    }
    
    /*MARK: ++++++++++++++++++++ EVENTS ++++++++++++++++++++*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.searchbar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailView.searchbar.becomeFirstResponder()
    }
    
    //MARK: >>>>> UISearchBarDelegate <<<<<
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMovies(by: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    //MARK: >>>>> MoviesDelegate <<<<<
    
    func movieSelected(_ movie: Movie, on controller: MoviesController) {
        let vc = UIStoryboard.instanceMovieDetail()
        vc.movie = movie
        present(vc, animated: true, completion: nil)
    }

}
