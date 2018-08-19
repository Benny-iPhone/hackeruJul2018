//
//  AppManager.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

extension Notification.Name{
    static var locationDidUpdate : Notification.Name{
        get{
            return Notification.Name(rawValue: "locationDidUpdateNotification")
        }
    }
}

class AppManager: NSObject, CLLocationManagerDelegate {
    static let manager = AppManager()
    
    var userLocation : CLLocation?{
        get{
            return locationManager.location
        }
    }
    
    private let locationManager = CLLocationManager()
    
    func detectUserLocation()
    {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50 //meter
        locationManager.delegate = self
        
        let authStatus = CLLocationManager.authorizationStatus()
        
        switch authStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            return
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        detectUserLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        
        NotificationCenter.default.post(name: .locationDidUpdate, object: self)
        
    }
}










