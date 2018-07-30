//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let myGen = MyGeneric();
myGen.printSome(toPrint: "some string")
myGen.printSome(toPrint: 45)
myGen.printSome(toPrint: ["bubu","groot","gamora"])
print(myGen.returnArray(toArray: 3.5))

var x = 5; var y = 7
print("x = \(x), y = \(y)")
myGen.swap(a: &x, b: &y)
print("after swap: x = \(x), y = \(y)")

class myClass: Selected{}
myGen.onlySelected(s: myClass());
