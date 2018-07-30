//
//  ViewController.swift
//  RadioPlayer
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

//http://www.radiosure.com/

class ViewController: UIViewController {
    
    private let radioStreamingURLString = "http://glglzwizzlv.bynetcdn.com/glglz_aes"
    private var player : AVPlayer?

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPlayer()
    }
    
    private func loadPlayer(){
        guard let url = URL(string: radioStreamingURLString) else{
            return
        }
        player = AVPlayer(url: url)
    }

    @IBAction func playPauseAction(_ sender: UIButton) {
        if sender.isSelected{
            //playing
            player?.pause()
            sender.isSelected = false
        } else {
            player?.play()
            player?.volume = volumeSlider.value
            sender.isSelected = true
        }
    }
    
    @IBAction func volumeAction(_ sender: UISlider) {
        player?.volume = sender.value
    }
    
    


}

