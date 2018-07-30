//
//  APIManager.swift
//  OMDBAPISampleProject
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    static let manager = APIManager()
    
    private let apiKey = "39fddb05"
    private let baseURL = "https://www.omdbapi.com"
    
    typealias SearchCallback = (_ arr : [OMDBObject], _ err : Error?) -> Void
    
    func search(term : String, page : Int, callback : @escaping SearchCallback)
    {
        let params : [String:Any] = [
            "s":term,
            "page":page,
            "apikey":apiKey
        ]
        
        Alamofire.request(baseURL, method: .get, parameters: params).responseJSON { (response) in
            
            guard let json = response.result.value as? [String:Any] else{
                callback([],response.result.error)
                return
            }
            
            
            //array of dictionary is the value for 'Search', empty if nil
            let rawArray = json["Search"] as? [[String:Any]] ?? []
            //Xcode 9.4
            let arr = rawArray.compactMap { OMDBObject($0)}
            //Xcode 9.2
            //let arr = rawArray.flatMap { OMDBObject($0)}
            
            callback(arr,nil)
            
        }
    }
}









