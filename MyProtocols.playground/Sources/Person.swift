import Foundation
public class Person : LivingBeing{
    public var age:Int;
    public init(age:Int){
        self.age = age;
    }
    public func breath(){
         print("the person breath through the nose")
    }
    
    public func consume(_ toConsume:Consumption){
        switch toConsume {
        case Consumption.DRINK:
            print("the person drink somthing")
        case Consumption.FOOD:
            print("the person eat the food")
        }
    }
 
}
