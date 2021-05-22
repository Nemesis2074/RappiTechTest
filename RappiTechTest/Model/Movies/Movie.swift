//
//  Movie.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation
import RealmSwift

class Movie: Object, Decodable {
    
    @objc dynamic var idMovie: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var rating: Float = 0.0
    @objc dynamic var votes: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case rating = "vote_average"
        case votes = "vote_count"
        case title, popularity
    }
    
    var posterUrl: URL?{
        let path = String(format: Endpoints.Images, posterPath)
        return URL(string: path)
    }
    
    var date: Date?{
        return Date.from(string: releaseDate, format: "yyyy-MM-dd")
    }
    
    var ratingFormatted: String{
        let value = rating / 10
        return value.toPercent()
    }
    
    var dateFormatted: String?{
        date?.toFormat("dd MMMM yyyy")
    }
    
    override static func primaryKey() -> String? {
        return "idMovie"
    }
}
