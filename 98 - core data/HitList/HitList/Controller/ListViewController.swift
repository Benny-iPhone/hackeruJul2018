//
//  ListViewController.swift
//  HitList
//
//  Created by hackeru on 26/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    
    var controller : NSFetchedResultsController<Target>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self //yes I know, its possible to hook via storyboard too
        self.controller = Target.fetchedResultsController()
        controller.delegate = self //the controller will update us with very interesting events
    }
    
    //MARK: - TableView
    
    //how many groups (sections) of lines (rows)
    func numberOfSections(in tableView: UITableView) -> Int {
        //sections conut is uinique lastNames count
        return controller.sections?.count ?? 0
    }
    
    //group header text
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return controller.sections![section].name
    }
    
    //number of line for each group
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.sections![section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TargetCell
        
        cell.configure(with: controller.object(at: indexPath))
        cell.delegate = self
        
        return cell
    }
    
    
    //*** Support Edit
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //we only support delete
        guard editingStyle == .delete else{
            return
        }
        
        let context = DatabaseManager.manager.persistentContainer.viewContext
        let object = controller.object(at: indexPath)
        
        context.delete(object)
        DatabaseManager.manager.saveContext()
        
        
    }
    
    //***

}

extension ListViewController : TargetCellDelegate
{
    
    func targetCell(_ cell: TargetCell, changeValueForIsAlive value: Bool) {
        //find index for row
        guard let indexPath = tableView.indexPath(for: cell) else{
            return
        }
        
        //get the object
        let object = controller.object(at: indexPath)
        //update the data
        object.isAlive = value
        //command+s (save)
        DatabaseManager.manager.saveContext()
    }
    
}

extension ListViewController : NSFetchedResultsControllerDelegate
{
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //hey tableview, from now on you will get a bulk of command, please queue them and DO NOT do anything, yet.
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //hey again, I finished with my junk, you can start commiting the queued commands now
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        default:
            break
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
     
        switch type {
        case .insert: //new target
            tableView.insertRows(at: [newIndexPath!], with: .right)
        case .delete: //target deleted
            tableView.deleteRows(at: [indexPath!], with: .left)
        case .move: //order of target changed (affected by sort desriptors)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        case .update:
            //a target's data updated , refresh cell content0
            let data = self.controller.object(at: indexPath!)
            if let cell = tableView.cellForRow(at: indexPath!) as? TargetCell{
                cell.configure(with: data)
            }
            
        }
        
    }
}






















