import UIKit
class SecondController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let b = Bundle.main;
    var emails:[String]!;
    var users: [String: [String: Any]]!;
    
    override func viewDidLoad() {
        let path=b.path(forResource: "users", ofType: "plist")!;
        users = NSDictionary(contentsOfFile: path) as! [String: [String: Any]];
        emails = Array(users.keys);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = emails[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let email = emails[indexPath.row];
        let name = users[email]!["name"]! as! String;
        let age = users[email]!["age"]! as! Int;
        let isMarried = users[email]!["isMarried"]! as! Bool;
        print("name \(name) age \(age) isMarried \(isMarried)");
    }
    
    
}


