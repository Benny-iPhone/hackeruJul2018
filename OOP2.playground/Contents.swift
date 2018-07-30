//
class A{
    var name = "bubu";
}
var a1 = A();
var a2 = a1;//by reference
print(a1.name);
a2.name = "Groot";
print(a1.name);
struct B{
    var name = "B00B00";
}
var b1 = B();
var b2 = b1;//by copy
print(b1.name);
b2.name = "Wolvi";
print(b1.name);
class AA : A{}//class can inherit from a class
//struct BB : B{}//struct cannot inherit from non-protocol

//Inheritance -> IS a
class Animal{
    var name: String;
    var isAlive: Bool;
    init(){
        self.name = "Incognito";
        self.isAlive = true;
    }
    func die(){
        self.isAlive = false;
    }
    func makeNoise(){
        print("\(name) make noise");
    }
}
//Dog is an Animal
class Dog : Animal{}

let d1 = Dog();
d1.name = "Rexie";

class Cat : Animal{
    
    override func makeNoise() {
        super.makeNoise();
        print("Miao");
    }
    func drink(_ beverage: String){
        if isAlive{
            switch beverage.lowercased() {
            case "milk", "water":
                print("Gladly drinks \(beverage)");
            default:
                print("Cat refuse to drink \(beverage)");
            }
        }
    }
}

let c1 = Cat();
c1.name = "Mizzi";
c1.makeNoise();
c1.drink("water");

class Helloer{
    static func sayHi(){
        sayHi(to: "");
    }
    static func sayHi(to name:String){
        print("Hello \(name)");
    }
}
Helloer.sayHi(to: "Bubu");
Helloer.sayHi();


