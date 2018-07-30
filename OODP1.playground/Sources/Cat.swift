import Foundation

public class Cat : Animal, NoiseMaker {
    
    public override init(){
        super.init();
        self.name = "Mizi";
    }
    
    public func miao(){
        makeNoise();
    }
    
    public func makeNoise(){
       print("Miao");
    }
    
}
