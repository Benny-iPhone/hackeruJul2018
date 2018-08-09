//
//  ViewController+ext.swift
//  AlertProject
//
//  Created by Benny Davidovitz on 09/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class PickerViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var daySelectedCallback : ((Day)->Void)?
    
    enum Day : Int{
        case sunday, monday, thuseday, wednesday, thursday, friday, saturday
        
        static let count = 7
        
        var name : String{
            get{
                switch self {
                case .sunday: return "ראשון"
                case .monday: return "שני"
                case .thuseday:  return "שלישי"
                case .wednesday: return "רביעי"
                case .thursday:  return "חמישי"
                case .friday:  return "שישי"
                case .saturday: return "שבת"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 320, height: 200)
        
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pickerView)
        
        self.view.addConstraints([
            NSLayoutConstraint(item: pickerView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: pickerView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: pickerView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: pickerView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0),
            
            ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Day.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Day(rawValue: row)?.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let day = Day(rawValue: row) else { return }
        daySelectedCallback?(day)
    }
    
}

extension ViewController{
    
    @IBAction func alertWithPickerView(){
        
        let alert = UIAlertController(title: "Select a Day", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            
        }))
        
        let pickerVC = PickerViewController()
        pickerVC.daySelectedCallback = {
            print($0.name)
        }
        
        alert.setValue(pickerVC, forKey: "contentViewController")
        
        self.present(alert, animated: true, completion: nil)
    }
    
}






