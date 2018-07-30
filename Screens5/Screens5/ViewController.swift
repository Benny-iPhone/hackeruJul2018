import UIKit

class ViewController: UIViewController {

    @IBAction func gamora(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "gamora");
        show(vc!, sender: self);
    }
    
    @IBAction func avia(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "avia");
        present(vc!, animated: true, completion: nil);
    }
    
}

