//
//  HeaderView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit

class HeaderView: UICollectionReusableView {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    private func initComponents(){
        self.backgroundColor = UIColor.clear
        
        title.font = Styles.Font.big
    }
    
}
