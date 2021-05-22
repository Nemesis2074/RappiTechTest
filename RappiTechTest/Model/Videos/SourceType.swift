//
//  SourceType.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 21/05/21.
//

import Foundation

public enum SourceType: String {
    case YouTube
    case Vimeo
    
    public func getUrl(from key:String) -> URL?{
        let baseUrl: String = {
            switch(self){
                case .YouTube:
                    return "video_url_youtube".localized()
                case .Vimeo:
                    return "video_url_vimeo".localized()
            }
        }()
        let url = String(format:baseUrl, key)
        return URL(string: url)
    }
}
