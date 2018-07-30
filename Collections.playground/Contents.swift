//Example 1
//Array declaration
var arr : [Int];
//Array initialization of empty array
    arr = [];
//Push a value:
arr.append(5);
arr.append(13);
arr.append(5);
arr.append(13);
print(arr);
print(arr[2]);
//Pop a value
print(arr.removeLast());
//Dequeue a value
print(arr.removeFirst());
print(arr);
print(arr.count);
arr.insert(100, at: 0);
arr.insert(888, at: 2);
arr.remove(at: 2);
print(arr);

//Example 2
//Inline declaration & initialization
let nums = [15,12,13,46,78,8];
print(nums.count);

//Example 3
//Array of specific type, specific size and with given values
let fourBubus = [String](repeatElement("Bubu", count: 4));
print(fourBubus);

//Example 4
//Dictionary (Map)
var sGrades : [String : Int] = [:];
sGrades["Gamora"] = 90;
sGrades["StarLord"] = 76;
sGrades["Rocket"] = 100;
sGrades["Groot"] = 55;
print(sGrades);
print(sGrades.count);
//Iterations
//Keys
for k in sGrades.keys{
    print(k);
}
//Values
for v in sGrades.values{
    print(v);
}
//Keys & Values
for (k, v) in sGrades{
    print("\(k) -> \(v)");
}

//Example 5
//Inline declaration & initialization
let movies = ["Avengers 3": 90, "50 shades": 1];
print(movies);

//Example 6
//Set - Collection of uniques
var set = Set<Int>();
set.insert(10);
set.insert(5);
set.insert(3);
set.insert(5);
set.insert(10);
print(set.count);
print(set);
if(set.contains(5)){
    print("has five");
}
for n in set{
    print(n);
}

//Exercise:
let nums2 = [-7, 0, 80, 59, 8009];
//1) Create an array with ints and find Max
var max = Int.min;
for n in nums2{
    if n > max{
        max = n;
    }
}
print("Max: \(max)");
//2) Create an array with ints and find Average
var sum = 0;
for n in nums2{
    sum += n;
}
print("Average: \(Double(sum)/Double(nums2.count))");
//3) Create a dictionary with grades associated by names [String:Int]
//and find the names with highes grade
max = Int.min;
var magnivim = Set<String>();
for (k, v) in sGrades{
    if v >= max{
        if v > max{
            magnivim.removeAll();
        }
        magnivim.insert(k);
    }
}









