
import UIKit

class SecondController: UIViewController, UITableViewDataSource {
    
    let data: [[String]] = [
        ["Apple", "Orange", "Raspberry"],
        ["Swift", "Java", "C++", "Obj C", "Javascript"]
    ];
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = data[indexPath.section][indexPath.row];
        return cell;
    }
    
}
