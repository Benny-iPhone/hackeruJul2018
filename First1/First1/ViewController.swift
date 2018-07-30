
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ttl: UILabel!;
    
    //equivalent onCreate - once - first
    override func viewDidLoad() {
        //find view by index
        if 0 < view.subviews.count{
            //change bgColor
            view.subviews[0].backgroundColor = UIColor.cyan;
        }
    }
    //equivalent onStart1 - always when screen opens - view invisible
    override func viewWillAppear(_ animated: Bool) {
        //get view root - change bgColor
        self.view.backgroundColor = UIColor.red;
    }
    //equivalent onStart2 - always when screen opens - view visible
    override func viewDidAppear(_ animated: Bool) {
        //change bgColor to view by ref ttl
        ttl.backgroundColor = UIColor.green;
    }
    //equivalent onStop1 - always when screen closes - view visible
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    //equivalent onStop2 - always when screen closes - view invisible
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
}
