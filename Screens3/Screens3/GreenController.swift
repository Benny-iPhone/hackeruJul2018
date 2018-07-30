import UIKit
class GreenController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("Green screeen open");
    }
    
    //when back button pressed
    @IBAction func back(_ btn:UIButton){
        //dismiss current view controller
        dismiss(animated: true, completion: nil);
    }
}
