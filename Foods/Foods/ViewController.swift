import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var keys: [String]!;
    var foods: [String: [String]]!;
    
    override func viewDidLoad() {
        let file = Bundle.main.path(forResource: "foods", ofType: "plist")!;
        foods = NSDictionary(contentsOfFile: file) as! Dictionary;
        keys = Array(foods.keys);
    }
    
    //One section for each key (Category)
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count;
    }
    //One row for each value in array by key
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods[keys[section]]!.count;
    }
    //Food in each cell
    func tableView(_ tbl: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get recycled view for cell
        let cell = tbl.dequeueReusableCell(withIdentifier: "food")!;
        //get food text from array by current section & row
        let foodTxt = foods[keys[indexPath.section]]![indexPath.row];
        cell.textLabel?.text = foodTxt;
        return cell;
    }
    //Key - as a title of each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = keys[section];
        return "\(key) - \(foods[key]!.count) items";
    }
    //Called when food selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodTxt = foods[keys[indexPath.section]]![indexPath.row];
        let vc = storyboard?.instantiateViewController(withIdentifier: "foodScreen") as! FoodController;
        vc.setFood(foodTxt);
        show(vc, sender: self);
    }

}











