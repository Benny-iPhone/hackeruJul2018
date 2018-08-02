//: Playground - noun: a place where people can play

import UIKit

let arr : [Int] = [1,2,3,2,1,4,4,5,3]

var x = 0
for n in arr{
    x = x^n
}

print(x)
