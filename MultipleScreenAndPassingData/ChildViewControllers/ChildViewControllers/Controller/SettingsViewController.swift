//
//  SettingsViewController.swift
//  ChildViewControllers
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    static func createVC() -> SettingsViewController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "settingsVC") as! SettingsViewController
    }
    
    @IBAction func backAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
