//
//  Date+Utils.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import Foundation

extension Date{
    
    func isAfter(_ date:Date) -> Bool{
        if(self.timeIntervalSince1970 > date.timeIntervalSince1970){
            return true
        }
        return false
    }
    
    func isBefore(_ date:Date) -> Bool{
        if(self.timeIntervalSince1970 < date.timeIntervalSince1970){
            return true
        }
        return false
    }
    
    static func from(string: String, format: String) -> Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
    
    func toFormat(_ format:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
