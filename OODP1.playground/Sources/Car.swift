import Foundation

public class Car : Vehicle, NoiseMaker{
    
    public override func drive(){
        print("Car drives");
    }
    
    public func makeNoise(){
        print("Brum burm");
    }
    
}
