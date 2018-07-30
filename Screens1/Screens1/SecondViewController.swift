import UIKit
class SecondViewController: UIViewController {

    @IBOutlet weak var ttl: UILabel!;
    let colors = [
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.white,
    ];
    var i = 0;
    
    override func viewWillAppear(_ animated: Bool) {
        i = (i+1 < colors.count ? i+1 : 0);
        ttl.backgroundColor = colors[i];
    }
    

}