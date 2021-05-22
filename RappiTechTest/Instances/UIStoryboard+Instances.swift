//
//  UIStoryboard+Instances.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import Foundation
import UIKit

extension UIStoryboard{
    
    func instanceVC<T>() -> T{
        let identifier = String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func main() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func instanceMovies(category: MovieCategory) -> MoviesViewController{
        let vc: MoviesViewController = main().instanceVC()
        vc.category = category
        return vc
    }
    
    class func instanceSearch() -> SearchViewController{
        return main().instanceVC()
    }
    
    class func instanceMovieDetail() -> MovieDetailViewController{
        return main().instanceVC()
    }
    
}
