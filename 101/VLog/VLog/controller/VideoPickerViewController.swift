//
//  VideoPickerViewController.swift
//  VLog
//
//  Created by Benny Davidovitz on 06/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit

class VideoPickerViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var playVideoButton: UIButton!
    
    var videoId : String?{
        didSet{
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshUI()
    }
    
    private func refreshUI(){
        playVideoButton.isEnabled = videoId != nil
        
        if let videoId = self.videoId{
            thumbnailImageView.image = Utils.thumbnailImageBy(videoId: videoId)
        }
    }
    @IBAction func saveAction(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        guard let videoId = self.videoId else {
            return
        }
        
        let context = DatabaseManager.manager.context
        let obj = Item(context: context)
        
        obj.date = Date()
        obj.name = name
        obj.videoId = videoId
        
        DatabaseManager.manager.saveContext()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func takeVideoAction(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .savedPhotosAlbum
        }
        
        //limit to video
        picker.mediaTypes = [kUTTypeMovie as String]
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func playVideoAction(_ sender: Any) {
        
        guard let videoId = self.videoId else {
            return
        }
        
        let videoURL = Utils.videoUrlBy(videoId: videoId)
        
        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer(url: videoURL)
        
        self.present(playerVC, animated: true) {
            playerVC.player?.play()
        }
        
    }
    
}

extension VideoPickerViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //remove picker ui
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //remove picker ui
        picker.dismiss(animated: true, completion: nil)
        
        //handle result
        guard let selectedMediaType = info[UIImagePickerControllerMediaType] as? String,
            selectedMediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerControllerMediaURL] as? URL
        else {
            return
        }
        
        //prepare data
        let image = thumbnail(fromVideoUrl: url)!
        let videoData = try! Data(contentsOf: url)
        //prepare video id
        let id = UUID().uuidString
        
        //in background thread
        DispatchQueue.global().async {
            //save image
            let imageData = UIImageJPEGRepresentation(image, 0.7)!
            Utils.write(data: imageData, filename: "thumb_" + id, ext: "jpeg")
            
            //save video
            Utils.write(data: videoData, filename: id, ext: "MOV")
            
            //back to main thead for UI updates
            DispatchQueue.main.async {
                self.videoId = id
            }
        }
        
        
    }
    
    private func thumbnail(fromVideoUrl url : URL) -> UIImage?
    {
        let asset = AVURLAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        let time = CMTime(seconds: 0, preferredTimescale: 600)
        
        guard let cgImage = try? generator.copyCGImage(at: time, actualTime: nil) else{
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
    
}






























