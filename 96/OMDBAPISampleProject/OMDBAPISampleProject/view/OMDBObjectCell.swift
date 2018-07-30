//
//  OMDBObjectCell.swift
//  OMDBAPISampleProject
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class OMDBObjectCell: UITableViewCell {

    @IBOutlet weak var posterImageView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!

    func configure(with object : OMDBObject)
    {
        nameLabel.text = object.title
        typeLabel.text = object.type
        
        if let url = object.posterURL{
            posterImageView.sd_setImage(with: url)
        } else {
            posterImageView.image = nil
            posterImageView.sd_cancelCurrentImageLoad()
        }
    }
}















