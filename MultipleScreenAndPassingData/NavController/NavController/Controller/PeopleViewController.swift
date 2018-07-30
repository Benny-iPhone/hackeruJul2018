//
//  PeopleViewController.swift
//  NavController
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var tableArray : [Person] = []
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableArray = Person.locaPeople()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let indexPath = tableView.indexPathForSelectedRow
        if let personVC = segue.destination as? PersonViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell)
        {
            personVC.person = tableArray[indexPath.row]
            personVC.indexPath = indexPath
            personVC.delegate = self
        }
    }
    
}

extension PeopleViewController : PersonViewControllerDelegate{
    
    func personViewController(_ controller: PersonViewController, didUpdatePerson person: Person) {
        
        tableView.reloadRows(at: [controller.indexPath], with: .automatic)
        
    }
}

extension PeopleViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row].name
        
        return cell
        
    }
    
}
















