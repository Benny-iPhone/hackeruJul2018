import UIKit
class FoodController : UIViewController{
   
    @IBOutlet weak var ttl:UILabel!;
    
    var foodTxt: String!;
    var qnty = 0;
    
    func setFood(_ foodTxt: String){
        self.foodTxt = foodTxt;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showTtl();
    }
    
    @IBAction func back(_ btn: UIButton){
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func qntyChange(_ s: UIStepper){
        qnty = Int(s.value);
        showTtl();
    }
    
    private func showTtl(){
        ttl.text = "\(foodTxt!) - \(qnty)";
    }
    
    
}






