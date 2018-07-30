
//Usage


var d = Danger();

//Example 1

do{//Success handling
    
    //Can have multiple tries in the same block
    try d.notReallyBad();
    
    try d.doBad();
    
}catch{//Error handling
    print("Error handling");
}

//Example 2 - multiple catch
do{
    try d.goToWork();
}catch WorkError.isSunday{
    print("Need more sleep");
}catch WorkError.notEnoughSleep{
    print("Drink more coffee");
}catch WorkError.notEnoughCoffee{
    print("At this point, there is nothing much you can do");
}catch{
    print("Another problem");
}

//Example 3 - defer
do{
    try d.badAndClean();
}catch{
    print("bad hanlde");
}

//Example 4 - inline syntax
try! d.notReallyBad();//if thrown - crash
try? d.notReallyBad();//if thrown - return nil




