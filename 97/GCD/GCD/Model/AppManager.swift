//
//  AppManager.swift
//  GCD
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation

class AppManager{
    static let manager = AppManager()
    
    private let queue : DispatchQueue
    typealias Callback = (_ error : Error?) -> Void
    
    init() {
        let identifier = UUID().uuidString
        queue = DispatchQueue(label: identifier)
    }
    
    func write(text : String, callback : @escaping Callback)
    {
        print(text)
        queue.async {
            self.internalWrite(text: text, callback: callback)
        }
    }
    
    private func internalWrite(text : String, callback : @escaping Callback)
    {
        let filename = "file.txt"
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //print(documentDir)
        let fileURL = documentDir.appendingPathComponent(filename)
        let data = text.data(using: .utf8) ?? Data()
        //try? data.write(to: fileURL)
        
        do{
            try data.write(to: fileURL)
            callback(nil)
        } catch (let saveError){
            print(saveError)
            callback(saveError)
        }
    }
}













