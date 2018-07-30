import Foundation

public class Animal{
    var isAlive:Bool;
    init(){
        self.isAlive = true;
    }
    public func die(){
        self.isAlive = false;
    }
}
