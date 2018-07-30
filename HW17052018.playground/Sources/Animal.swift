import Foundation

public class Animal{
    var name: String;
    var isAlive: Bool;
    init(){
        self.name = "incognito";
        self.isAlive = true;
    }
    public func makeNoise(){
        print("Beep");
    }
}
