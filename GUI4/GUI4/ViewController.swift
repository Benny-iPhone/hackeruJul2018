
import UIKit

class ViewController: UIViewController {

    private let images:[UIImage?] = [
        UIImage(named: "wonder"),
        UIImage(named: "widow"),
        UIImage(named: "domino"),
        UIImage(named: "gamora"),
    ];
    
    @IBOutlet var img: UIImageView!;
    
    @IBAction func changeImg(_ btn: UIButton) {
        if let image = images[btn.tag]{
           img.image = image;
        }
    }
    

}

