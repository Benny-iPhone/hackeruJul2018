import Foundation

public class Weapon{
    
    private var name:String;
    private var damage:Damage;
    
    public init(name:String, damage: Damage){
        self.name = name;
        self.damage = damage;
    }
    
    public func attack(){
        print("\(name) attacks with level \(damage.level)");
    }
    
}
