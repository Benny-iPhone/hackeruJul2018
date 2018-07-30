import UIKit
class ViewController: UIViewController, UITableViewDataSource {

    let b = Bundle.main;
    var heroes: [String]!;
    
    override func viewDidLoad() {
        //Get path for heroes.plist file
        let path = b.path(forResource: "heroes", ofType: "plist")!;
        //Deserialize [String] from given file
        heroes = NSArray(contentsOfFile: path) as! [String];
        
        print(heroes);
        
        //Alternative:
        let url = URL(fileURLWithPath: path);
        let d = try! Data(contentsOf: url);
        let h = try! PropertyListSerialization.propertyList(from: d, format: nil) as! [String];
        
        print(h);
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = heroes[indexPath.row];
        return cell;
    }
    

}
