//
//  TabsViewController.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit

class TabsViewController: UITabBarController {

    /*MARK: ++++++++++++++++++++ METHODS ++++++++++++++++++++*/
    
    private func initComponents(){
        self.tabBar.barStyle = .default
        self.tabBar.isOpaque = true
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = Styles.Color.textAccent
        self.tabBar.barTintColor = Styles.Color.bgGeneral
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: -0.5, height: -0.5)
        self.tabBar.layer.shadowOpacity = Styles.Constants.ShadowOpacity
        self.tabBar.layer.shadowRadius = Styles.Constants.ShadowRadius
        
        self.viewControllers?.removeAll()
        
        MovieCategory.allCases.forEach { (category) in
            let vc = UIStoryboard.instanceMovies(category: category)
            vc.tabBarItem.title = category.asString()
            vc.tabBarItem.image = category.asIcon()
            vc.tabBarItem.selectedImage = category.asIcon()
            self.viewControllers?.append(vc)
        }
        
        let vc = UIStoryboard.instanceSearch()
        vc.tabBarItem.title = "title_search".localized()
        vc.tabBarItem.image = Styles.Icon.tabSearch
        vc.tabBarItem.selectedImage = Styles.Icon.tabSearch
        self.viewControllers?.append(vc)
        
        self.selectedIndex = 0
    }
    
    /*MARK: ++++++++++++++++++++ EVENTS ++++++++++++++++++++*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initComponents()
    }

}
