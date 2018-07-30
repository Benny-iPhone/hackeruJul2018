import Foundation
//Cat is an Animal
public class Cat : Animal{
    //Cat can be instantiated from outside
    public override init() {
        
    }
    public func drink(_ beverage: String){
        if isAlive{
            switch beverage.lowercased(){
                case "milk", "water":
                    print("Cat gladly drinks \(beverage)");
                default:
                    print("Cat refuse");
            }
        }
    }
}
