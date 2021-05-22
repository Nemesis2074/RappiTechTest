//
//  Float+Utils.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import Foundation

extension Float{
    
    func toPercent() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self) ) ?? ""
    }
    
}
