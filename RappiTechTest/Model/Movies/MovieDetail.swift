//
//  MovieDetail.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import UIKit
import RealmSwift

class MovieDetail: Object, Decodable {
    
    @objc dynamic var idMovie: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var backdropPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var rating: Float = 0.0
    @objc dynamic var votes: Int = 0
    @objc dynamic var runtime: Int = 0
    
    public var videos: Response<Video>? = nil
    public var genres = List<Genre>()
    
    enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case rating = "vote_average"
        case votes = "vote_count"
        case title, overview, popularity, runtime, genres, videos
    }
    
    var posterUrl: URL?{
        let path = String(format: Endpoints.Images, posterPath)
        return URL(string: path)
    }
    
    var backdropUrl: URL?{
        let path = String(format: Endpoints.Images, backdropPath)
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
    
    var runtimeFormatted: String{
        let hours = runtime / 60
        let minutes = runtime % 60
        let hoursFormat = hours > 0 ? "\(hours)h" : ""
        let minFormatted = minutes > 0 ? "\(minutes)m" : ""
        
        return hoursFormat + " " + minFormatted
    }
    
    var genresFormatted: String{
        return genres.map{ $0.name }.joined(separator: ", ")
    }
    
    public func hasVideos() -> Bool{
        return (videos != nil && !videos!.results.isEmpty)
    }
    
    override static func primaryKey() -> String? {
        return "idMovie"
    }
    
}
