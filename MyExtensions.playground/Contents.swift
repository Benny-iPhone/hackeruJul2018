//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
extension Int{
   
    func doubleIt()->Int{
        return self*2;
    }
    func multiply(multiplier :Int)->Int{
        return self*multiplier;
    }
}
var i = 10;
print(i.doubleIt())
print(i.multiply(multiplier: 10))

extension Person : Mutant{
    public func showAbility() {
        print("some ability..")
    }
}
