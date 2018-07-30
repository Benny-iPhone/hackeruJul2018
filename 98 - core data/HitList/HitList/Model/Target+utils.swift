//
//  Target+utils.swift
//  HitList
//
//  Created by hackeru on 26/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import Foundation
import CoreData

extension Target{
    
    var fullName : String{
        get{
            
            var arr : [String] = []
            if let firstName = firstName{
                arr += [firstName]
            }
            
            if let lastName = lastName{
                arr += [lastName]
            }
            
            return arr.joined(separator: " ")
            
        }
    }
    
    class func createTargetWith(firstName : String,
                                lastName : String,
                                birthDate : Date)
    {
        let context = DatabaseManager.manager.persistentContainer.viewContext
        //Create
        let target = Target(context: context)
        
        //Update
        target.firstName = firstName
        target.lastName = lastName
        target.birthDate = birthDate
        target.isAlive = true
        
        //Save To Disk
        DatabaseManager.manager.saveContext()
        
    }
    
    //We are using NSFetchedResultsController in order to  use CoreData Features
    class func fetchedResultsController() -> NSFetchedResultsController<Target>
    {
        //setup request
        let request : NSFetchRequest<Target> = Target.fetchRequest()
        request.predicate = nil //filter can be applied here
        request.sortDescriptors = [
            NSSortDescriptor(key: "lastName", ascending: true), //Main Sort
            NSSortDescriptor(key: "firstName", ascending: true) //Seconday Sort
        ]
        
        //Setup results controller
        let context = DatabaseManager.manager.persistentContainer.viewContext
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "lastName", cacheName: nil)
        //run query
        try? controller.performFetch()
        
        //return results
        return controller
    }
}










