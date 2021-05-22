//
//  Response.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation

typealias Completed<T> = (Swift.Result<T, ResponseError>) -> Void

struct Response<T: Decodable>: Decodable {
    
    let page: Int?
    let results:[T]
    
    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

public struct ResponseError: Error{
    let status: ResponseStatus
    let message: String?
}

public enum ResponseStatus: Int {
    case OK = 200
    case Fail = 400
    case UnauthorizedAccess = 401
    case Forbidden = 403
    case NotFound = 404
    case ServerError = 500
    case NoInternet = 601
    case NoData = 602
    case DatabaseError = 603
    
    public func toString() -> String{
        let key = String(format: "alert_status_%d", self.rawValue)
        return key.localized()
    }
}
