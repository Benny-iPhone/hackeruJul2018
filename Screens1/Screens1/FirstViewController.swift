import UIKit
class FirstViewController: UIViewController {
    var count = 0;
    @IBAction func addOne(_ btn: UIButton) {
        count += 1;
        btn.setTitle("\(count)", for: .normal);
    }
}