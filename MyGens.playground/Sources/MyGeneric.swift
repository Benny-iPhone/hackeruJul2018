import Foundation
public class MyGeneric{
    public init(){}
    public func printSome<Tmp>(toPrint:Tmp){
        print(toPrint);
    }
    public func returnArray<T>(toArray:T)->[T]{
    return [toArray];
    }
    
    public func swap<Temp>(a: inout Temp, b: inout Temp){
        let t = a;
        a = b;
        b = t;
    }
    
    public func onlySelected <T : Selected>(s:T){
        print(s);
    }

}
