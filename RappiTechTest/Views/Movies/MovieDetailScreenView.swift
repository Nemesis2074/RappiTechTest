//
//  MovieDetailScreenView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit

class MovieDetailScreenView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var rating: RatingView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    public weak var loadingView: LoadingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    private func initComponents(){
        scrollView.contentInsetAdjustmentBehavior = .never
        
        title.text = ""
        title.font = Styles.Font.largeBold
        
        originalTitle.text = ""
        originalTitle.font = Styles.Font.medium
        
        genres.text = ""
        genres.font = Styles.Font.normal
        
        duration.text = ""
        duration.font = Styles.Font.normal
        
        ratingLabel.text = "label_rating".localized()
        ratingLabel.font = Styles.Font.normal
        
        synopsisLabel.text = "label_synopsis".localized()
        synopsisLabel.font = Styles.Font.normal
        
        synopsis.text = ""
        synopsis.font = Styles.Font.medium
        
        playButton.isHidden = true
        
        let loadingView = LoadingView(frame: CGRect.zero)
        self.loadingView = loadingView
        self.addSubview(loadingView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingView.frame = self.frame
    }

}
