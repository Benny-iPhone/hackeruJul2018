//
//  OMDBObject.swift
//  OMDBAPISampleProject
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation

class OMDBObject{
    let title : String?
    let year : String?
    let imdbId : String
    let type : String?
    let posterURL : URL?
    
    init?(_ dict : [String:Any])
    {
        guard let id = dict["imdbID"] as? String else{
            return nil
        }
        
        self.imdbId = id
        self.title = dict["Title"] as? String
        self.year = dict["Year"] as? String
        self.type = dict["Type"] as? String
        
        if let urlString = dict["Poster"] as? String, urlString != "N/A"{
            self.posterURL = URL(string: urlString)
        } else {
            self.posterURL = nil
        }
    }
    
}

















