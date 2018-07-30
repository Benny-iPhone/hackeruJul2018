//
//  ViewController.swift
//  Beeper
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    var timer : Timer?
    
    @IBAction func toggleTimerAction(){
        if let timer = timer{
            timer.invalidate()
            self.timer = nil
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { [weak self] t in
            guard let mySelf = self else{
                t.invalidate()
                return
            }
            mySelf.playBeep()
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAudioFile()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.playBeep()
//        }
    }
    
    private func loadAudioFile(){
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "mp3") else{
            return
        }
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }
    
    private func playBeep()
    {
        player?.play()
    }
    

}






