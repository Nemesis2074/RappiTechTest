//
//  PopularViewController.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit
import Toast_Swift

class MoviesViewController: UIViewController, MoviesDelegate {

    /*MARK: ++++++++++++++++++++ PROPERTIES ++++++++++++++++++++*/
    
    @IBOutlet weak var containerView: XibView!
    
    private var detailView: MoviesScreenView{
        return containerView.contentView as! MoviesScreenView
    }
    
    private lazy var listController: MoviesController = {
        return MoviesController(with: self,
                                collectionView: detailView.collectionView)
    }()
    
    public var category: MovieCategory = .Popular
    
    /*MARK: ++++++++++++++++++++ METHODS ++++++++++++++++++++*/
    
    @IBAction func onRefresh(){
        self.loadMovies{
            self.detailView.refreshControl.endRefreshing()
        }
    }
    
    private func loadContent(){
        self.detailView.loadingView.startAnimating()
        self.loadMovies {
            self.detailView.loadingView.stopAnimating()
        }
    }
    
    private func loadMovies(_ completed:@escaping () -> Void){
        RepositoryManager.loadMovies(filterBy: category) { (result) in
            switch(result){
                case .success(let movies):
                    self.listController.category = self.category
                    self.listController.updateMovies(movies)
                    
                case .failure(let error):
                    self.view.makeToast(error.status.toString())
            }
            completed()
        }
    }
    
    /*MARK: ++++++++++++++++++++ EVENTS ++++++++++++++++++++*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.refreshControl.addTarget(self,
                                            action: #selector(onRefresh),
                                            for: .valueChanged)
        
        loadContent()
    }
    
    //MARK: >>>>> MoviesDelegate <<<<<
    
    func movieSelected(_ movie: Movie, on controller: MoviesController) {
        let vc = UIStoryboard.instanceMovieDetail()
        vc.movie = movie
        present(vc, animated: true, completion: nil)
    }

}
