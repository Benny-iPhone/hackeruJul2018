import UIKit
class FirstController: UIViewController, UITableViewDataSource {
    
    //How many sublists in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    //How many rows in sublist
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    //How to show the view of a row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = "Bubu \(indexPath.row)";
        return cell;
    }

}