//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let p = Person(age:23);
p.breath();
p.consume(Consumption.DRINK);
print(p.age)
let a = Animal(age:4);
a.breath();
a.consume(Consumption.FOOD);
print(a.age)
