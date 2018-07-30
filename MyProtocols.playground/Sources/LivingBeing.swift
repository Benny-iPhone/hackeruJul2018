import Foundation

public protocol LivingBeing{
    
    var age:Int{get};
    func breath();
    func consume(_ toConsume:Consumption);

}
