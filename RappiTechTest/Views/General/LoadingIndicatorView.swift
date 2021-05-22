//
//  LoadingIndicatorView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import UIKit

class LoadingIndicatorView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
    }
    
    private func initComponents() {
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.clear
        self.isHidden = true
        self.animationDuration = 1.0
        
        self.animationImages = [ UIImage(named:"loading_01")!,
                                 UIImage(named:"loading_02")!,
                                 UIImage(named:"loading_03")!,
                                 UIImage(named:"loading_04")!,
                                 UIImage(named:"loading_05")!,
                                 UIImage(named:"loading_06")!,
                                 UIImage(named:"loading_07")!,
                                 UIImage(named:"loading_08")!,
                                 UIImage(named:"loading_09")!,
                                 UIImage(named:"loading_10")!,
                                 UIImage(named:"loading_11")!,
                                 UIImage(named:"loading_12")!,
                                 UIImage(named:"loading_13")!,
                                 UIImage(named:"loading_14")!,
                                 UIImage(named:"loading_15")!,
                                 UIImage(named:"loading_16")!,
                                 UIImage(named:"loading_17")!,
                                 UIImage(named:"loading_18")!,
                                 UIImage(named:"loading_19")!,
                                 UIImage(named:"loading_20")!,
                                 UIImage(named:"loading_21")!,
                                 UIImage(named:"loading_22")!,
                                 UIImage(named:"loading_23")!,
                                 UIImage(named:"loading_24")!,
                                 UIImage(named:"loading_25")!,
                                 UIImage(named:"loading_26")!,
                                 UIImage(named:"loading_27")!,
                                 UIImage(named:"loading_28")!,
                                 UIImage(named:"loading_29")!,
                                 UIImage(named:"loading_30")!]
    }
    
    override func startAnimating() {
        self.isHidden = false
        super.startAnimating()
    }
    
    override func stopAnimating() {
        self.isHidden = true
        super.stopAnimating()
    }
    
}
