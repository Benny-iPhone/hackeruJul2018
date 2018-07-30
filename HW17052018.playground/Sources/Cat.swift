import Foundation

public class Cat : Animal{
    override public init(){
        super.init();
    }
    override public func makeNoise(){
        print("Miao");
    }
}
