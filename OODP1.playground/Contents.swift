import Foundation
var a:Animal;

//a = Animal();//Not accessible

//upcasting
a = Cat();
//downcasting
(a as! Cat).miao();
//a.name//Not accessible


//Polymorphism with composition
let bow = Weapon(name: "Bow", damage: Damage(level: 57));
bow.attack();
let glock = Weapon(name: "Glock21", damage: Damage(level: 206));
glock.attack();






