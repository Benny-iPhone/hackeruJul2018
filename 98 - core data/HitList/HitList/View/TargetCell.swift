//
//  TargetCell.swift
//  HitList
//
//  Created by hackeru on 26/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

protocol TargetCellDelegate : NSObjectProtocol { //when extending NSObjectProtocol reference can be weak
    
    func targetCell(_ cell : TargetCell, changeValueForIsAlive value : Bool)
    
}

class TargetCell: UITableViewCell {
    
    weak var delegate : TargetCellDelegate?

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var isAliveSwitch: UISwitch!
    
    func configure(with target : Target)
    {
        fullnameLabel.text = target.fullName
        
        if let date = target.birthDate{ //birthdate is not nil
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            birthdateLabel.text = formatter.string(from: date)
        } else {
            birthdateLabel.text = ""
        }
        
        isAliveSwitch.isOn = target.isAlive
        
    }
    
    
    @IBAction func isAliveSwitchAction(_ sender: UISwitch) {
        //cell notify its delegate about the event with the related data
        delegate?.targetCell(self, changeValueForIsAlive: sender.isOn)
        
    }
    
    
    
}








