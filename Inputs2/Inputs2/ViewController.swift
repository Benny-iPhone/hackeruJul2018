import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var tz: UITextField!;
    
    @IBOutlet weak var pass: UITextField!;
    
    //Ex1 - when button clicked
    @IBAction func send(_ sender: UIButton) {
        //cancel the status of firstResponder to tz
        tz.resignFirstResponder();
    }
    
    //Ex2 - when screen is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //force resign firstResponder to all text fields
        self.view.endEditing(true);
    }
    
    //Ex3 - when return button clicked - Did end on exit
    @IBAction func passDone(_ sender: UITextField) {
        print("Resign firstResponder implicitly");
    }
    
    
    
    
    
    
    
    
    
    
    
    
}