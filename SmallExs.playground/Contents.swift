//: Playground - noun: a place where people can play

import UIKit

var str = ""
for _ in 1...5{
    str.append("*")
    print(str)
}

let nums = [0,1,3,4,5,6]

for i in 0...nums.count-1{
    if(i != nums[i]){
        print("missing num is: \(i)")
        break;
    }
}

let nums2 = [3,5,2,6,4]
var sum = 0;
for i in nums2{
    
    sum += i;
}
print(21-sum)

var str1 = "*"
var str2 = "       *"

for _ in 0...4{
    print(str1+str2)
    str1 = " "+str1
    if(str2.count>0){
        str2.remove(at: str2.startIndex)
        str2.remove(at: str2.startIndex)
    }
}


