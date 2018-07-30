import Foundation

public class Rectangle : DrawableShape{
    
    private var base: Int;
    private var height: Int;
    
    public init(origin: Point, base: Int, height: Int){
        self.base = base;
        self.height = height;
        super.init(origin: origin);
    }
    
    override public func calcArea(){
        self.area = Double(base * height) / 2;
    }
    
}
