//
//  ServicesManager.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit
import Reachability
import Alamofire

internal typealias ResponseProgress = (CGFloat) -> Void

internal typealias ResponseSuccess<T> = (T) -> Void

internal typealias ResponseFail = (ResponseError) -> Void

internal class ServicesManager: NSObject {

    public struct Params{
        static let ApiKey = "api_key"
        static let Append = "append_to_response"
    }
    
    public class func isInternetAvailable() -> Bool{
        let reach = try! Reachability()
        return reach.connection != .unavailable
    }
    
    internal class func processStatus(_ response: HTTPURLResponse?) -> ResponseStatus{
        let value = response?.statusCode ?? 0
        let status = ResponseStatus(rawValue: value) ?? .Fail
        return status
    }
    
}
