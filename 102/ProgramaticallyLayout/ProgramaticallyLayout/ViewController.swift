//
//  ViewController.swift
//  ProgramaticallyLayout
//
//  Created by Benny Davidovitz on 09/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(containerView)
        
        self.view.addConstraints([
            //top 24
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 24),
            //trailing 24
            NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 24),
            //leading 24
            NSLayoutConstraint(item: containerView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 24),
            //height 60%
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.6, constant: 0)
            ])
        
        
        let label = UILabel(frame: .zero)
        label.text = "Hello World 😀"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        
        containerView.addConstraints([
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0)

            ])
        
        
        
    }



}












