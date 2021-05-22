//
//  FilterType.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation
import UIKit

public enum MovieCategory: String, CaseIterable {
    case Top
    case Upcoming
    case Popular
    
    public func asString() -> String{
        let key = String(format:"title_%@", self.rawValue.lowercased())
        return key.localized()
    }
    
    public func asIcon() -> UIImage?{
        let key = String(format:"tab_%@", self.rawValue.lowercased())
        return UIImage(named: key)
    }
}
