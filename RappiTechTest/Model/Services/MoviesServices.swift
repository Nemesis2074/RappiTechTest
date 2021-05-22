//
//  MoviesServices.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation

internal struct MoviesServices{
    static let TopRated = Endpoints.Services + "/movie/top_rated"
    static let Upcoming = Endpoints.Services + "/movie/upcoming"
    static let Popular = Endpoints.Services + "/movie/popular"
    static let MovieDetail = Endpoints.Services + "/movie/%d"
    static let Videos = Endpoints.Services + "/movie/%d/videos"
}
