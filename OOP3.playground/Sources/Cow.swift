import Foundation

public class Cow : Animal{
    
    public override init(){}
    
    public func giveMilk()->String?{
        //if isAlive return "Milk" otherwise nil
        return isAlive ? "Milk" : nil;
    }
}
