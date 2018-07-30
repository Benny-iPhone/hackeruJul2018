//
//  ViewController.swift
//  MyPickerView
//
//  Created by hackeru on 12/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    var keyValueDict:[String:String]!;
    var keys:[String]!;
    var values:[String]!;
    var selectedKey:String!;
    var selectedValue:String!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        keyValueDict = ["bubu":"bubu is awsome","deadpool":"maksimum efford","groot":"I am groot","bamba":"warning! contains penuts!"]
        keys = [];
        values = ["I am groot","warning! contains penuts!","I am groot","bubu is awsome"];
        keys.append(contentsOf: keyValueDict.keys)
//        values.append(contentsOf: keyValueDict.values)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyValueDict.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return keys[row]
        case 1:
            return values[row]
        default:
            return "out of bounds"
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            selectedKey = keys[row]
        }
        if(component == 1){
            selectedValue = values[row]
        }
        if(selectedValue != nil && selectedKey != nil){
            if(keyValueDict[selectedKey] == selectedValue){
                let alert = UIAlertController(title: "Match!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                present(alert, animated: true, completion: nil)
            }
        }
        }

    
}

