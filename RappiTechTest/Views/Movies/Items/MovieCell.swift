//
//  MovieCell.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var rating: RatingView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    private func initComponents() {
        backgroundColor = UIColor.clear
        clipsToBounds = false
        
        cardView.clipsToBounds = false
        cardView.backgroundColor = Styles.Color.bgCard
        cardView.layer.cornerRadius = Styles.Constants.CornerRadius
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = Styles.Constants.ShadowOffset//CGSize(width: -1.0, height: -1.0)
        cardView.layer.shadowOpacity = Styles.Constants.ShadowOpacity
        cardView.layer.shadowRadius = Styles.Constants.ShadowRadius //10
        
        container.clipsToBounds = true
        container.layer.cornerRadius = Styles.Constants.CornerRadius
        
        title.font = Styles.Font.normalBold
        date.font = Styles.Font.normal
    }

}
