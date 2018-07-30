import Foundation

public class Queue{
    
    class Node{
        let value: Int;
        var next: Node?;
        init(value:Int){
            self.value = value;
        }
    }
    
    private var first: Node?;
    private var count = 0;

    public init(){}
    
    public func getCount()->Int{
        return count;
    }
    
    private func add(_ current: Node?, value: Int)->Node?{
        if current == nil{
            count += 1;
            return Node(value: value);
        }
        current!.next = add(current!.next, value: value);
        return current;
    }
    
    public func add(_ value:Int){
        first = add(first, value: value);
    }
    
    public func dequeue()->Int?{
        var val: Int? = nil;
        if first != nil{
           val = first!.value;
           first = first!.next;
            count -= 1;
        }
        return val;
    }
    
    
}
