import Foundation
public class Animal : LivingBeing{
    
    public var age:Int;
    public init(age:Int){
        self.age = age;
    }
    public func breath(){
        print("Animal Breath like this: AAAAA")
    }
    
    public func consume(_ toConsume:Consumption){
        switch toConsume {
            
            case Consumption.FOOD:
                print("Animal eat the food")
            case Consumption.DRINK:
                print("Drink...")
            
        }
    }
}
