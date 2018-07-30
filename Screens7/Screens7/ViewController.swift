import UIKit
class ViewController: UIViewController {
    
    @IBAction func toYakov(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "yakov");
        navigationController?.pushViewController(vc!, animated: true);
    }
    
    @IBAction func back(_ sender: UIButton){
        navigationController?.popViewController(animated: true);
    }
    
}
