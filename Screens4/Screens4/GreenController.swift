import UIKit

class GreenController : UIViewController{
    
    @IBOutlet weak var txt: UILabel!;
    
    private var name: String?;
    
    func setName(_ name: String){
        self.name = name;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txt.text = name;
    }
    
}
