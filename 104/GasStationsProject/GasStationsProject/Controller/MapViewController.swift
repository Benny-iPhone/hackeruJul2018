//
//  MapViewController.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private func zoom(to location : CLLocation?){
        guard let location = location else { return }
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true

        let params = GasStationAPI.GetParams.init(state: "NY", limit: 100, zipcode: nil)
        
        GasStationAPI.manager.getStations(with: params) {
            self.mapView.addAnnotations($0)
            self.zoom(to: $0.first?.location)
        }
        
    }


}







