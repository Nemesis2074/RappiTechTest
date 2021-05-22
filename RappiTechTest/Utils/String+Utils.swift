//
//  String+Utils.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 19/05/21.
//

import Foundation

extension String{
    
    func localized() -> String {
        let localized  = NSLocalizedString(self, comment: "")
        return localized
    }

}
