//
//  Video.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit
import RealmSwift

class Video: Object, Decodable {
    
    @objc dynamic var idVideo: String = ""
    @objc dynamic var idMovie: Int = 0
    @objc dynamic var key: String = ""
    @objc dynamic var site: String = ""
    
    var sourceType: SourceType{
        return SourceType(rawValue: site) ?? .YouTube
    }
    
    var url: URL?{
        return sourceType.getUrl(from: key)
    }
    
    enum CodingKeys: String, CodingKey {
        case idVideo = "id"
        case key, site
    }
    
    override static func primaryKey() -> String? {
        return "idVideo"
    }
}
