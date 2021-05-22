//
//  Services+Movies.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation
import Alamofire

extension ServicesManager{
    
    internal class func requestMovies(filterBy filter: MovieCategory,
                                      success:@escaping ResponseSuccess<[Movie]>,
                                      fail:@escaping ResponseFail){
        
        let params: Parameters = [Params.ApiKey: "f168fa4c58c24efc579cc186e067b6e9"]
        
        let request = AF.request(filter.asSourceUrl(),
                                 method: .get, parameters: params,
                                 encoding: URLEncoding.default, headers: nil)
        
        request.responseDecodable(of: Response<Movie>.self) { (response) in
            switch(response.result){
                case .success(let response):
                    success(response.results)
                    
                case .failure(_):
                    let status = processStatus(response.response)
                    let error = ResponseError(status: status, message: "")
                    fail(error)
            }
        }
    }
    
    internal class func requestMovieDetail(by idMovie: Int,
                                           success:@escaping ResponseSuccess<MovieDetail>,
                                           fail:@escaping ResponseFail){
        
        let params: Parameters = [Params.ApiKey: "f168fa4c58c24efc579cc186e067b6e9",
                                  Params.Append: "videos" ]
        
        let url = String(format: MoviesServices.MovieDetail, idMovie)
        
        let request = AF.request(url,
                                 method: .get, parameters: params,
                                 encoding: URLEncoding.default, headers: nil)
        
        request.responseDecodable(of: MovieDetail.self) { (response) in
            switch(response.result){
                case .success(let movie):
                    success(movie)
                    
                case .failure(_):
                    let status = processStatus(response.response)
                    let error = ResponseError(status: status, message: "")
                    fail(error)
            }
        }
    }
    
}

extension MovieCategory{
    
    fileprivate func asSourceUrl() -> String{
        switch(self){
            case .Popular:
                return MoviesServices.Popular
            case .Top:
                return MoviesServices.TopRated
            case .Upcoming:
                return MoviesServices.Upcoming
        }
    }
}
