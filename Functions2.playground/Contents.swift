//Functions
//Example 1 - variadic arguments
func sayHi(_ names: String...){
    for n in names{
        print("Hello to \(n)");
    }
}
sayHi("Groot");
sayHi("Hulk", "Thor", "Drax");

//Exercise
func triNums(_ count: UInt)->[UInt]{
    var triNums:[UInt] = [];//array of Ints
    for n in 1...count{//iterate until count
        triNums.append((n * (n + 1)) / 2);//calc each triangular number
    }
    return triNums;
}
print(triNums(5));

//Tuple
var t1 : (name: String, age: Int);
t1.name = "Bubu";
t1.age = 32;
print(t1);

let t2 = (ip: "10.0.0.241", port: 8083);
print(t2);

let t3 = (80, 443, 22);
print(t3.0);
print(t3.1);

//Example 2 - multiple return values
func avenger()->(name: String, infinityStonesCount: Int){
    return (name: "Vision", infinityStonesCount: 1);
}
print(avenger().infinityStonesCount);

//Exercise
func maxMin(_ nums: Int...)->(max: Int, min: Int){
    var max = Int.min, min = Int.max;
    for n in nums{
        if n > max{
            max = n;
        }
        if n < min{
            min = n;
        }
    }
    return (max, min);
}

print(maxMin(15, 18, 23, 98, -99));

//Optionals - Can be nil(null)
var x: Int?;
x = 1;
x = nil;

func maybeInt(_ go: Bool)->Int?{
    if go {
        return 10;
    }
    return nil;
}

//Safe unwrapping with if
if let n = maybeInt(true){
    print(n);
}
//Unsafe unwrapping!
print(maybeInt(true)!);

var grades = ["Rocket": 100, "Groot": 55];
print(grades["Rocket"]);

if let a = grades["Rocket"]{//unwrap
    print(a);
}
let b = grades["Groot"]!;//unwrap
print(b);

//Ex 1
var bubus: [String: Int?] = ["Bubu": 10];
print(bubus["Bubu"]!!);

//Ex 2
let c = grades["Vlad"] ?? 100;
print(c);















