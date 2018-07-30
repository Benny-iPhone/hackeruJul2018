//
//  ViewController.swift
//  GCD
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func downloadImageAction(_ sender: UIButton) {
        
        let imageURLString = "http://7wallpapers.net/wp-content/uploads/20_Game-Of-Thrones.jpg"
        
        //begin background task
        let taskIdentifier = UIApplication.shared.beginBackgroundTask {
            //stuff to do when task ends
        }
        
        let url = URL(string: imageURLString)!
        DispatchQueue.global().async { //go to background thread to perform heavy task
            guard let data = try? Data(contentsOf: url) else{
                print("download failed")
                UIApplication.shared.endBackgroundTask(taskIdentifier)
                return
            }
            
            DispatchQueue.main.async { //back to main thread in order to display the result in UI
                let image = UIImage(data: data)
                self.imageView.image = image
                
                UIApplication.shared.endBackgroundTask(taskIdentifier)
                
            }
        }
        
    }
    
    
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBAction func doSomethingLater(_ sender: UIButton) {
        
        sender.isEnabled = false
        indicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.isEnabled = true
            sender.setTitle("42", for: .normal)
            self.indicatorView.stopAnimating()
        }
        
        /*
        DispatchQueue.main.async {
            print("2")
        }
        
        DispatchQueue.global().async {
            print("3")
        }
        
        print("1")
        */
        /*
         // -- Very Stupid & Not Buggy
        sender.isEnabled = false
        indicatorView.startAnimating()
        //go to background thread
        DispatchQueue.global().async {
            sleep(3) //seconds
            
            print("done")
            //Go To Main Thread
            DispatchQueue.main.async {
                sender.isEnabled = true
                sender.setTitle("42", for: .normal)
                self.indicatorView.stopAnimating()
            }
        }
         */
        
        /*
        // -- Very Stupid & Buggy
         
        indicatorView.startAnimating()
        
        sleep(3) //seconds
        
        sender.setTitle("42", for: .normal)
        indicatorView.stopAnimating()
        */
    }
    
}



















