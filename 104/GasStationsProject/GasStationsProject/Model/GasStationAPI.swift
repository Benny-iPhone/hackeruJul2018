//
//  GasStationAPI.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import Alamofire

class GasStationAPI: NSObject {
    static let manager = GasStationAPI()
    
    typealias Callback = (_ arr : [GasStation]) -> Void
    
    private let apiKey = "6c02Z8pS17l7VeJV2VCMKx0toIS1yvu2YLzkttRL"
    
    struct GetParams {
        let state : String
        let limit : Int?
        let zipcode : Int?
    }
    
    func getStations(with params : GetParams, callback : @escaping Callback)
    {
        let urlString = "https://developer.nrel.gov/api/alt-fuel-stations/v1.json"
        
        var parameters : [String:Any] = [:]
        parameters["api_key"] = self.apiKey
        parameters["state"] = params.state
        if let limit = params.limit{
            parameters["limit"] = limit
        }
        
        if let zipcode = params.zipcode{
            parameters["zip"] = zipcode
        }
        
        Alamofire.request(urlString, method: .get, parameters: parameters).responseJSON { (dataRes) in
            guard let json = dataRes.result.value as? [String:Any] else{
                callback([])
                return
            }
            
            //array of dictionaries
            guard let rawArray = json["fuel_stations"] as? [[String:Any]] else{
                callback([])
                return
            }
            
            let stationsArray = rawArray.compactMap{ GasStation($0)}
            callback(stationsArray)
        }
        
    }
}













