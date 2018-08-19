//
//  GasStation.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class GasStation: NSObject {
    let name : String
    let location : CLLocation
    let instructions : String
    
    init?(_ dict : [String:Any])
    {
        guard let lat = dict["latitude"] as? CLLocationDegrees,
            let long = dict["longitude"] as? CLLocationDegrees else{
                return nil
        }
        
        self.location = CLLocation(latitude: lat, longitude: long)
        self.name = dict["station_name"] as? String ?? ""
        self.instructions = dict["intersection_directions"] as? String ?? ""
    }
}

extension GasStation : MKAnnotation{
    var title: String?{
        get{
            return name
        }
    }
    
    var coordinate: CLLocationCoordinate2D{
        get{
            return location.coordinate
        }
    }
}













