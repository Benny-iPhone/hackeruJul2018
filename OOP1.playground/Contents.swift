//OOP -> IS, HAS, DOES
class A{//A is Any
    //A instance has b (non static  variable)
    var b = 0;
    //A type has c (static  variable)
    static var c = 1;
    //A instance does d (non static method)
    func d(){}
    //A type does e (static method)
    static func e(){}
}
//instantiation
let a1 = A();//a1 is A
let a2 = A();

class Person{
    var name: String = "Incognito";
    var age: Int = 0;
    var isMarried: Bool = false;
    func sayHi(){
        print("\(name) says Hi");
    }
}
let p1 = Person();
let p2 = Person();

var people : [Person] = [
    p1, p2, Person()
];
p1.name = "Diesel";
p2.name = "Groot";

for p in people{
    p.sayHi();
}

//constructors
class iPhone{
    static let os = "iOS";
    var version = 11;
    var owner: Person;
    init(owner: Person){
        self.owner = owner;
    }
    func showOS(){
        print("\(iPhone.os) \(self.version)");
    }
    func makeCall(to phone: iPhone){
        phone.receiveCall(from: self);
    }
    func receiveCall(from phone: iPhone){
        print("\(self.owner.name) received a call from \(phone.owner.name)");
    }
}
//Objects behavior
let phone1 = iPhone(owner: p1);
let phone2 = iPhone(owner: p2);
phone1.makeCall(to: phone2);





