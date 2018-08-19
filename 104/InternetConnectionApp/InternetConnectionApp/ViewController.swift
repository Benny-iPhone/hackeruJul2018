//
//  ViewController.swift
//  InternetConnectionApp
//
//  Created by Benny Davidovitz on 16/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var reachability : Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupReachability()
    }
    
    private func setupReachability()
    {
        self.reachability = Reachability()
        
        func handler(_ r : Reachability){
            switch r.connection {
            case .cellular:
                label.text = "cellular"
                label.textColor = .black
            case .wifi:
                label.text = "wifi"
                label.textColor = .blue
            case .none:
                label.text = "no connection"
                label.textColor = .red
            }
        }
        
        handler(reachability)
        
        reachability.whenReachable = handler
        reachability.whenUnreachable = handler
        
        try? reachability.startNotifier()
    }

}















