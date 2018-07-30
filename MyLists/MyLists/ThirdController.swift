import UIKit
class ThirdController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data: [String: [String]] = [
        "Android" : ["Java", "Kotlin", "XML", "SQL", "REGEX"],
        "iOS": ["Swift", "XML"]
    ];
    
    var keys: [String]!;
    
    override func viewDidLoad() {
        keys = Array(data.keys);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[keys[section]]!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //to use recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!;
        cell.textLabel?.text = data[keys[indexPath.section]]![indexPath.row];
        return cell;
    }
    //What title to show above each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section];
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(keys[section].count) languages";
    }
    
    //Called when user did select specific row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let txt = data[keys[indexPath.section]]![indexPath.row];
        let vc = storyboard?.instantiateViewController(withIdentifier: "langScreen") as! LanguageController;
        vc.setLang(txt);
        navigationController?.pushViewController(vc, animated: true);
    }
    

}












