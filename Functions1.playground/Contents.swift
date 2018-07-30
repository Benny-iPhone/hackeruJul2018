//Functions

//Example 1 - simple function
func sayHi(){
    print("Hello");
}
sayHi();

//Example 2 - params
func sayHi(to: String){//default external parameter name
    print("Hello to \(to)");
}
func sayHi(_ to:String){//ommit external parameter name
    print("Hola to \(to)");
}
sayHi(to: "Groot");//invoke with external name
sayHi("Bubu");//invoke without

//Example 3 - multiple params with default external names
func sayHi(from: String, to: String){
    print("Hello from \(from) to \(to)");
}
sayHi(from: "Deadpool", to: "Vanessa");

//Example 4 - controlling param names
func plus(_ n1: Int, and n2: Int){
    print(n1 + n2);
}
plus(15, and: 2);

//Example 5 - void functions
func a(){}//void - implicit
func b()->(){}//void - explicit using empty Tuple
func c()->Void{}//void - explicit using built in Void struct

//Example 6 - pure function
func minus(_ n1: Double, and n2: Double)->Double{
    return n1 - n2;
}

print(minus(10, and: 3));

//Example 7 - default param value
func who(amI: String = "Groot"){
    print("I am \(amI)");
}
who();
who(amI: "Batman");













