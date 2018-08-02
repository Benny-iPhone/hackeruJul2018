//
//  ViewController.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

extension UIView {
    
    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            self.layer.render(in: currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    @IBAction func redAction(_ sender: Any) {
        drawView.strokeColor = .red
    }
    
    @IBAction func blueAction(_ sender: Any) {
        drawView.strokeColor = .blue
    }
    
    @IBAction func purpleAction(_ sender: Any) {
        drawView.strokeColor = .purple
    }
    
    @IBAction func clearAction(_ sender: Any) {
        
        drawView.clear()
        
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        drawView.strokeWidth = CGFloat(sender.value)
        
    }
    
    @IBAction func shareAction(_ sender: Any) {
        
        guard let image = drawView.asImage() else{
            return
        }
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
}









