//
//  Genre.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit
import RealmSwift

class Genre: Object, Decodable {

    @objc dynamic var idGenre: Int = 0
    @objc dynamic var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case idGenre = "id"
        case name
    }
    
    override static func primaryKey() -> String? {
        return "idGenre"
    }
}
