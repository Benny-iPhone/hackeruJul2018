//
//  Person.swift
//  NavController
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import Foundation

class Person{
    var name : String
    init(name : String) {
        self.name = name
    }
    
    static func locaPeople() -> [Person]
    {
        //return "a,b,c,d".components(separatedBy: ",").map{Person(name:$0)}
        let names : [String] = [
            "Avia",
            "Stas",
            "Tom",
            "Nico",
            "Vlad",
            "Yakov",
            "Yair",
            "Benny"
        ]
        
        let arr = names.map({ (str : String) -> Person in
            return Person(name: str)
        })
        
        return arr
        
        //return names.map { Person(name: $0)}
        
    }
}





















