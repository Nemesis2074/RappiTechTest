//
//  MovieDetailViewController.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit
import SDWebImage
import Toast_Swift

class MovieDetailViewController: UIViewController {

    /*MARK: ++++++++++++++++++++ PROPERTIES ++++++++++++++++++++*/
    
    @IBOutlet weak var containerView: XibView!
    
    private var detailView: MovieDetailScreenView{
        return containerView.contentView as! MovieDetailScreenView
    }
    
    public var movie = Movie()
    private var video = Video()
    
    /*MARK: ++++++++++++++++++++ METHODS ++++++++++++++++++++*/
    
    private func showDetail(_ detail: MovieDetail){
        detailView.backdrop.sd_setImage(with: detail.backdropUrl, placeholderImage: nil)
        detailView.poster.sd_setImage(with: detail.posterUrl, placeholderImage: nil)
        detailView.title.text = detail.title
        detailView.originalTitle.text = detail.originalTitle
        detailView.genres.text = detail.genresFormatted
        detailView.duration.text = detail.runtimeFormatted
        detailView.rating.label.text = detail.ratingFormatted
        detailView.synopsis.text = detail.overview
        
        detailView.playButton.addTarget(self,
                                        action: #selector(playTrailer),
                                        for: .touchUpInside)
        
        detailView.closeButton.addTarget(self,
                                         action: #selector(close),
                                         for: .touchUpInside)
        
        self.detailView.playButton.isHidden = !detail.hasVideos()
        if(detail.hasVideos()){
            self.video = detail.videos!.results[0]
        }
        
    }
    
    private func loadDetail(){
        self.detailView.loadingView.startAnimating()
        RepositoryManager.loadDetails(of: movie.idMovie) { (result) in
            switch(result){
                case .success(let details):
                    self.showDetail(details)
                    self.detailView.loadingView.stopAnimating()
                    
                case.failure(let error):
                    self.detailView.loadingView.stopAnimating{
                        self.view.makeToast(error.status.toString())
                    }
            }
        }
    }
    
    @IBAction func playTrailer(){
        UIApplication.shared.open(video.url!,
                                  options: [:],
                                  completionHandler: nil)
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    
    /*MARK: ++++++++++++++++++++ EVENTS ++++++++++++++++++++*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetail()
    }

}
