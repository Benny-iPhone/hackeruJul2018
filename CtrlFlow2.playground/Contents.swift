
//Example 1
switch(2){
    case 1:
        print("A");
    case 2:
        print("B");
        fallthrough;
    case 3:
        print("C");
    default:
        print("d");
}

//Example 2
let isOn = true;
switch(isOn){
    case true:
        print("is on");
    case false:
        print("is off");
}

//Example 3
let num = 5;
switch num {
    case 1, 3, 5:
        print("One three five");
    case 2, 4:
        print("Two four");
    default:
        print("Otherwise");
}

//Example 4
switch(num){
    case 1...6:
        print("one to six");
    case 7:
        print("Exactly seven");
    case 8...100:
        print("eight to hundred");
    default:
        print("Something else");
}

//Exercise
let month = 5;
switch month {
case 1,3,5,7,8,10,12:
    print("31 days in \(month)");
case 4,6,9,11:
    print("30 days in \(month)");
case 2:
    print("28 OR 29 days in \(month)");
default:
    print("invalid month number");
}





