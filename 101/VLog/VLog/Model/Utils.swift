//
//  Utils.swift
//  VLog
//
//  Created by Benny Davidovitz on 06/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation
import UIKit

class Utils{

    class func thumbnailImageBy(videoId : String) -> UIImage?
    {
        let documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fullFilename = "thumb_" + videoId + ".jpeg"
        let fileURL = documentsDirURL.appendingPathComponent(fullFilename)
        
        guard let data = try? Data(contentsOf: fileURL) else{
            return nil
        }
        
        return UIImage(data: data)
    }
    
    class func videoUrlBy(videoId : String) -> URL
    {
        let documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fullFilename = videoId + ".MOV"
        return documentsDirURL.appendingPathComponent(fullFilename)
    }
    
    class func write(data : Data, filename : String, ext : String)
    {
        let documentsDirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fullFilename = filename + "." + ext
        let fileURL = documentsDirURL.appendingPathComponent(fullFilename)
        
        try? data.write(to: fileURL)
        
        print(fileURL)
    }
    
}













