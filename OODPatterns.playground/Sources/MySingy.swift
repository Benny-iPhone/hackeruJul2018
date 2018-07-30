import Foundation

public class MySingy{
    //local stored instance reference
    private static var instance: MySingy?;
    //to prevent instantiation from outside
    private init(){}
    //share instance method
    public static func getInstance()->MySingy{
        if instance == nil{//if not created yet
           instance = MySingy();
        }
        return instance!;
    }
}
