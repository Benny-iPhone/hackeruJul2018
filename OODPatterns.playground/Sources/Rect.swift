import Foundation

public class Rect{
    
    private var x = 0;
    private var y = 0;
    private var height = 0;
    private var width = 0;
    private var color = "Transparent";
    
    public init(){}
    
    public func x(_ x: Int)->Rect{
        self.x = x;
        return self;
    }
    
    public func y(_ y: Int)->Rect{
        self.y = y;
        return self;
    }
    
    public func height(_ height: Int)->Rect{
        self.height = height;
        return self;
    }
    
    public func width(_ width: Int)->Rect{
        self.width = width;
        return self;
    }
    
    public func color(_ color: String)->Rect{
        self.color = color;
        return self;
    }
    
    public func size(width: Int, height: Int)->Rect{
        self.width = width;
        self.height = height;
        return self;
    }
    
    public func show(){
        print("\(color) \(width)x\(height) rectangular at \((x,y)) ");
    }
    
    
}
