//
//  APIManager.swift
//  GenderAPISampleApp
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation

class APIManager{
    
    static let manager = APIManager() //Shared Instance
    
    private let apiKey = "mvabClVyGwZEaKEpxW"
    
    enum Gender : String{
        case male = "male"
        case female = "female"
        case unknown = "unknown"
    }
    
    typealias GenderCallback = (_ gender : Gender?, _ error : Error?) -> Void
    
    func findGender(of name : String, with completion : @escaping GenderCallback)
    {
        let urlString = "https://gender-api.com/get?name=" + name + "&key=" + apiKey
        
        let request = URLRequest(url: URL(string: urlString)!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10) //seconds
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            /*
             data - bytes retrived from server
             response - immidiate server's response
             error - an error object if occur
             */
            self.handle(data: data, error: error, completion: completion)
            
        }.resume()
    }
    
    private func handle(data : Data?, error : Error? , completion : @escaping GenderCallback)
    {
        func invokeCompletion(with gender : Gender?, error : Error?){
            DispatchQueue.main.async {
                completion(gender,error)
            }
        }
        
        guard let data = data else{
            invokeCompletion(with: nil, error: error)
            return
        }
        
        guard let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else{
            debugPrint("failed to parse data to JSON")
            invokeCompletion(with: .unknown, error: nil)
            return
        }
        
        guard let dict = jsonObj as? [String:Any],
            let genderStr = dict["gender"] as? String,
            let gender = Gender(rawValue: genderStr) else{
                debugPrint("failed to parse data")
                invokeCompletion(with: .unknown, error: nil)
                return
        }
        
        invokeCompletion(with: gender, error: nil)
        
    }
    
}













