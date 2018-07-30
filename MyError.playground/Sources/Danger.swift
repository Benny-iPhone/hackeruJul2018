import UIKit

public class Danger{
    struct MyBad : Error{
       //Special bad stuff...
    }
   
    
    public init(){}
    
    public func doBad()throws{
        print("really bad");
        throw MyBad();
    }
    
    public func notReallyBad()throws{
        //not really throwing anything
        print("not really bad");
    }
    
    public func goToWork()throws{
        print("going to work");
        throw WorkError.notEnoughSleep;
    }
    
    public func badAndClean()throws{
        //Equivalent to finally
        //What to do any case if succeed or failed
        defer{
            print("defer - cleanups");
        }
        print("bad stuff");
        throw MyBad();
    }
    
}
