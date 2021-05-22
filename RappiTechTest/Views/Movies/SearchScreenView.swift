//
//  SearchScreenView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import UIKit

class SearchScreenView: UIView {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    private func initComponents(){
        
        searchbar.placeholder = "hint_search".localized()
        searchbar.returnKeyType = .done
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = UIColor.clear
        collectionView.backgroundView = UIView()
        collectionView.backgroundView!.backgroundColor = UIColor.clear
        
        collectionView.register(cell: .Movie)
    }
}
