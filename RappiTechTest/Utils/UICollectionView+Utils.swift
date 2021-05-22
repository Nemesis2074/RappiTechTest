//
//  UICollectionView+Utils.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 19/05/21.
//

import Foundation
import UIKit

extension UICollectionView{
    
    public enum CollectionCell: String{
        case Movie = "MovieCell"
    }
    
    public enum CollectionHeader: String{
        case Header = "HeaderView"
    }
    
    func register(cell:CollectionCell){
        let nib = UINib(nibName: cell.rawValue, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cell.rawValue)
    }
    
    func register(header:CollectionHeader){
        let nib = UINib(nibName: header.rawValue, bundle: nil)
        self.register(nib,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: header.rawValue)
    }
    
    func dequeueReusableCell(_ cell:CollectionCell, for indexPath:IndexPath) -> UICollectionViewCell{
        return self.dequeueReusableCell(withReuseIdentifier: cell.rawValue,
                                        for: indexPath)
    }
    
    func dequeueReusableHeader(_ header:CollectionHeader, for indexPath:IndexPath) -> UICollectionReusableView{
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                     withReuseIdentifier: header.rawValue,
                                                     for: indexPath)
    }
    
}
