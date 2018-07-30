import UIKit
class ViewController: UIViewController {

    @IBOutlet var section: UIView!;
    
    @IBAction func changeColor(_ btn: UIButton){
        section.backgroundColor = btn.backgroundColor;
    }
    
}