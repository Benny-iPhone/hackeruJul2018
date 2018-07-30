import Foundation

public class Animal{
    //Encapsulated to class
    private var isAlive:Bool;
    //Encapsulated to module
    var name: String!;
    //Encapsulated to module
    init(){
        self.isAlive = true;
    }
    
    public func die(){
        self.isAlive = false;
    }
    
    public func getIsAlive()-> Bool{
        return self.isAlive;
    }
    
}
