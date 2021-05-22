//
//  MoviesScreenView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit

class MoviesScreenView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    public weak var loadingView: LoadingView!
    public weak var refreshControl: UIRefreshControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    private func initComponents(){
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = UIColor.clear
        collectionView.backgroundView = UIView()
        collectionView.backgroundView!.backgroundColor = UIColor.clear
        
        let refreshControl = UIRefreshControl()
        self.refreshControl = refreshControl
        collectionView.insertSubview(refreshControl, at: 0)
        
        collectionView.register(header: .Header)
        collectionView.register(cell: .Movie)
        
        let loadingView = LoadingView(frame: CGRect.zero)
        self.loadingView = loadingView
        self.addSubview(loadingView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingView.frame = self.frame
    }

}
