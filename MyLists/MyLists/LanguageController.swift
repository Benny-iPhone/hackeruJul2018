import UIKit
class LanguageController: UIViewController {
    
    private var lang: String!;
    
    func setLang(_ lang:String){
        self.lang = lang;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //show in navigation title
        navigationItem.title = lang;
    }
    
}
