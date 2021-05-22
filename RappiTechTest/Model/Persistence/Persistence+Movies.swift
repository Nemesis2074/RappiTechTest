//
//  Persistence+Movies.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import Foundation
import RealmSwift

extension PersistenceManager{
    
    internal class func updateMovies(_ movies: [Movie]){
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(movies, update: .all)
            }
        }catch{}
    }
    
    internal class func loadMovies(filterBy category: MovieCategory,
                                   success:@escaping ResponseSuccess<[Movie]>,
                                   fail:@escaping ResponseFail){
        do{
            let realm = try Realm()
            
            let movies:[Movie] = {
                switch(category){
                    case .Top:
                        let movies = realm.objects(Movie.self)
                            .sorted(byKeyPath: category.asKeyPath(), ascending: false)
                            .filter{ $0.date!.isBefore(Date()) }
                        return Array(movies)
                    case .Popular:
                        let movies = realm.objects(Movie.self)
                            .sorted(byKeyPath: category.asKeyPath(), ascending: false)
                        return Array(movies)
                    case .Upcoming:
                        let movies = realm.objects(Movie.self)
                            .filter{ $0.date!.isAfter(Date()) }
                            .sorted { $0.date!.isAfter($1.date!) }
                        return Array(movies)
                }
            }()
            
            success(movies)
            
        }catch{
            let resError = ResponseError(status: .DatabaseError, message: nil)
            fail(resError)
        }
    }
    
    internal class func searchMovies(by query: String,
                                     success:@escaping ResponseSuccess<[Movie]>,
                                     fail:@escaping ResponseFail){
        do{
            let realm = try Realm()
            
            let movies = realm.objects(Movie.self)
                .filter{ $0.title.lowercased().contains(query.lowercased()) }
                .sorted{ $0.popularity > $1.popularity }
                
            success(Array(movies))
            
        }catch{
            let resError = ResponseError(status: .DatabaseError, message: nil)
            fail(resError)
        }
    }
    
    internal class func updateMovieDetails(_ movie: MovieDetail){
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(movie, update: .all)
            }
        }catch{}
    }
    
    internal class func loadMovieDetail(by idMovie: Int,
                                        success:@escaping ResponseSuccess<MovieDetail>,
                                        fail:@escaping ResponseFail){
        do{
            let realm = try Realm()
            let result = realm.objects(MovieDetail.self).filter("idMovie = %d", idMovie).first
            if let movie = result{
                success(movie)
            }else{
                let resError = ResponseError(status: .NoData, message: nil)
                fail(resError)
            }
        }catch{
            let resError = ResponseError(status: .DatabaseError, message: nil)
            fail(resError)
        }
    }
}

extension MovieCategory{
    
    fileprivate func asKeyPath() -> String{
        switch(self){
            case .Popular:
                return "popularity"
            case .Top:
                return "rating"
            case .Upcoming:
                return "releaseDate"
        }
    }
}
