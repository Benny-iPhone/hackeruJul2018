//
//  ListViewController.swift
//  GasStationsProject
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import MapKit

class ListViewController: UIViewController, UITableViewDataSource {

    var tableArray : [GasStation] = []
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppManager.manager.detectUserLocation()
        
        fetchData()
        
        NotificationCenter.default.addObserver(forName: .locationDidUpdate, object: nil, queue: .main) { (note) in
            self.tableView.reloadData()
        }
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    private func fetchData(){
        let params = GasStationAPI.GetParams(
            state: "CA",
            limit: 25,
            zipcode: nil
        )
        
        GasStationAPI.manager.getStations(with: params) { (arr) in
            self.tableArray = arr
            self.tableView.reloadData()
        }
    }
    
    //MARK: - UITableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let station = tableArray[indexPath.row]
        
        cell.textLabel?.text = station.name
        
        if let userLocation = AppManager.manager.userLocation{
            
            let distance = userLocation.distance(from: station.location) //meter
            
            cell.detailTextLabel?.text = String(format: "%.2f km",distance/1000)
            
//            let formatter = MKDistanceFormatter()
//            formatter.units = .metric
//            formatter.unitStyle = .abbreviated
//
//            cell.detailTextLabel?.text = formatter.string(fromDistance: distance)
            
        } else {
            cell.detailTextLabel?.text = "N/A"
        }
        
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let detailsVC = segue.destination as? GasStationDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            
            detailsVC.station = tableArray[indexPath.row]
            
        }
        
    }
    

}







