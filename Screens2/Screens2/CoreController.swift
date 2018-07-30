import UIKit
class CoreController : UIViewController{
    @IBOutlet weak var ttl: UILabel?;
    var count = 0;
    override func viewWillAppear(_ animated: Bool) {
        if ttl != nil{
            count += 1;
            ttl!.text = "\(count)";
        }
    }
}
