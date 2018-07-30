
import UIKit

class RedController: UIViewController {
    
    @IBOutlet weak var toGo: UISwitch!;
    
    //called before preparation segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return toGo.isOn;
    }
    
    //called before performing segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toGreen"{
            //Since we know that destination is GreenController
            //downcast to GreenController
            let vc = segue.destination as! GreenController;
            //send the data to destination
            vc.setName("Tom the king");
        }
        
    }
    
    @IBAction func step(_ sender: UIStepper) {
        if(sender.value > 5){
            performSegue(withIdentifier: "toGreen", sender: self);
        }
    }
    
    
    

}

