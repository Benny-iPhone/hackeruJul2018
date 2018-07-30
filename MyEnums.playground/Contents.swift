
//Example 1
enum Element{
    case Air;
    case Earth;
    case Fire;
    case Water;
}

var e : Element;//variable declaration
e = Element.Air;//explicit initialization
e = .Water;//implicit infered type

if e == Element.Water{//explicit
    print("Water can flow");
}
if e == .Water{//implicit
    print("Or it can crush");
}

//Standard usage
switch e {
case .Air:
    print("Air bender");
case .Fire:
    print("Fire in the hole");
case .Earth:
    print("What on earth is...");
case .Water:
    print("Favorite drink of Bruce Lee");
}

//Example 2 - inline declaration
enum Direction{
    case North, South, East, West;
}

var d = Direction.North;
print(d);
print("\(d) hashValue: \(d.hashValue)");

//Example 3 - enum can have computed property
enum Bulb{
    case A, B, C, D;
    var watt: Int{
        return self.hashValue * 50 + 10;
    }
}
var c = Bulb.C;
print("\(c) bulb works with \(c.watt) watt");

//Example 4 - can have instance methods
enum Apple{
    case iPod, iPad, iPhone, iCloud;
    
    func makeNoise(){
        switch self{
          case .iPod, .iPad, .iPhone:
            print("\(self) Ring ring");
          case .iCloud:
            print("Silence I kill you ;-P");
        }
    }
}

var iphone = Apple.iPhone;
iphone.makeNoise();












