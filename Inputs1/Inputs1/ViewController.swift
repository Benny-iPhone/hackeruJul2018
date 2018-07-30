import UIKit
class ViewController: UIViewController {
    //Reference to label
    @IBOutlet var lbl: UILabel!;
    //called when value of slider changed
    @IBAction func changeAlpha(_ sender: UISlider) {
        //take current value and use as alpha for label
        lbl.alpha = CGFloat(sender.value);
    }
    //called when value of switch changed
    @IBAction func toggle(_ sender: UISwitch) {
        //show label when switch isOn and vice versa
        lbl.isHidden = !sender.isOn;
    }
    //called when value of stepper changed
    @IBAction func changeQnty(_ sender: UIStepper) {
        //show current value in label
        lbl.text = "\(sender.value)";
    }
    //when value of segment control changed
    @IBAction func changeSeason(_ sender: UISegmentedControl) {
       //colors
       let colors = [
           UIColor.blue,//blue at index 0   - for winter
           UIColor.green,//blue at index 1  - for spring
           UIColor.yellow,//blue at index 2 - for summer
           UIColor.orange,//blue at index 3 - for fall
       ];
       //set bgColor of label by selected segment
       lbl.backgroundColor = colors[sender.selectedSegmentIndex];
    }
}