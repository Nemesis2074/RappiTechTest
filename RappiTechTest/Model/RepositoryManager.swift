//
//  RepositoryManager.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import UIKit

class RepositoryManager: NSObject {

    public class func loadMovies(filterBy category:MovieCategory,
                                  completed:@escaping Completed<[Movie]>){
        if(ServicesManager.isInternetAvailable()){
            ServicesManager.requestMovies(filterBy: category) { (movies) in
                PersistenceManager.updateMovies(movies)
                completed(.success(movies))
            } fail: { (error) in
                completed(.failure(error))
            }
        }else{
            PersistenceManager.loadMovies(filterBy: category) { (movies) in
                completed(.success(movies))
            } fail: { (error) in
                completed(.failure(error))
            }
        }
    }
    
    public class func searchMovies(query: String,
                                   completed:@escaping Completed<[Movie]>){
        PersistenceManager.searchMovies(by: query) { (movies) in
            completed(.success(movies))
        } fail: { (error) in
            completed(.failure(error))
        }
    }
    
    public class func loadDetails(of idMovie: Int,
                                  completed:@escaping Completed<MovieDetail>){
        if(ServicesManager.isInternetAvailable()){
            ServicesManager.requestMovieDetail(by: idMovie) { (movie) in
                PersistenceManager.updateMovieDetails(movie)
                completed(.success(movie))
            } fail: { (error) in
                completed(.failure(error))
            }
            
        }else{
            PersistenceManager.loadMovieDetail(by: idMovie) { (movie) in
                completed(.success(movie))
            } fail: { (error) in
                completed(.failure(error))
            }
        }
    }
    
}
