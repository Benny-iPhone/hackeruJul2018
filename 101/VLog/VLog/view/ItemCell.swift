//
//  ItemCell.swift
//  VLog
//
//  Created by Benny Davidovitz on 06/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

protocol ItemCellDelegate : NSObjectProtocol {
    func itemCellDidPressPlay(_ cell : ItemCell)
}

class ItemCell: UICollectionViewCell {
    
    weak var delegate : ItemCellDelegate?
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    
    func configure(with item : Item)
    {
        nameLabel.text = item.name
        imageView.image = Utils.thumbnailImageBy(videoId: item.videoId!)
    }
    
    @IBAction func playAction(){
        delegate?.itemCellDidPressPlay(self)
    }
}

















