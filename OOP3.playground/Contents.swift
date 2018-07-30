var a: A;//class accessible
a = A();//init accessible

print(a.pub);
//print(a.inter1);//isn't accessible
//print(a.inter2);//isn't accessible

var a1 : Animal;

a1 = Cat();

let c1 = Cow();
let c2 = Cat();
let c3 = a1 as! Cat;//Down casting

if let milk = c1.giveMilk(){
    c2.drink(milk);
}

print(a1 is Animal);
print(a1 is Cat);
print(a1 is Cow);
