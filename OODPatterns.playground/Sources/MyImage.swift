import Foundation

public class MyImage{
    
    private static var flyweightImages : [String: MyImage] = [:];
    
    public static func getImage(_ path: String)->MyImage{
        if flyweightImages[path] == nil{//Not exists
           flyweightImages[path] = MyImage(path);
        }
        return flyweightImages[path]!;
    }
    
    private let path:String;
    
    private init(_ path: String){
        self.path = path;
    }
    
    public func show(){
        print("Showing image from \(path)");
    }
    
    
    
}
