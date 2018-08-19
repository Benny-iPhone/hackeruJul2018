//
//  GasStationDetailsViewController.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class GasStationDetailsViewController: UIViewController {

    var station : GasStation!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = station.name
        infoLabel.text = station.instructions
    }

    @IBAction func wazeAction(_ sender: Any) {
        
        let urlString = "waze://?ll=\(station.location.coordinate.latitude),\(station.location.coordinate.longitude)&navigate=yes"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let app = UIApplication.shared
        guard app.canOpenURL(url) else {
            debugPrint("waze not installed")
            return
        }
        
        app.open(url, options: [:], completionHandler: nil)
        
    }
    
}





