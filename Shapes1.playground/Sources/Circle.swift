import Foundation

public class Circle : DrawableShape{
    
    private var radius: Int;
    
    public init(origin: Point, radius: Int){
        self.radius = radius;
        super.init(origin: origin);
    }
    
    override public func calcArea(){
        self.area = Double.pi * Double(radius * radius);
    }
}
