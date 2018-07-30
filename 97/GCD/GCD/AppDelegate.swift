//
//  AppDelegate.swift
//  GCD
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        func saveStringToFile(index : Int){
            let date = Date()
            let text = "\(index) string at \(date)  😀😍💩 \(date.timeIntervalSince1970)"
            AppManager.manager.write(text: text) { (err) in
                if let err = err{
                    print("save file \(index) failed with error " + err.localizedDescription)
                } else {
                    print("saved file \(index) successfuly")
                }
            }
        }
        
        for i in 0...1000{
            DispatchQueue.global().async {
                saveStringToFile(index: i)
            }
        }
        
//        DispatchQueue.main.async {
//            saveStringToFile(index: 5)
//        }
//        saveStringToFile(index: 4)
        
        
        return true
    }


}












