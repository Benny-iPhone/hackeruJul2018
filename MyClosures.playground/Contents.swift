var e = Executer();

//Example 1 - predefined function
func task0(){
    let msg = "Passed message";
    print(msg);
}
e.execute(task: task0);

//Example 2 - predefined function & capture
var num = 0;
func task1()->(){
    let n1 = 1;
    let n2 = 2;
    num = n1 + n2;
}
e.execute(task: task1);
print(num);

//Example 3 - shorter closure syntax
e.execute(task: {()->() in
    print("Passed message 2");
});

//Example 4 - even shorter
e.execute(task: {print("Passed msg 3")});

//Example 5 - even shorter ++
e.execute{print("Passed msg 4")}

//Example 6
var result:Double;
func multiply(n1: Double, n2: Double)->Double{
    return n1 * n2;
}
result = e.calc(n1: 4, n2: 2, oper: multiply);
print(result);

//Example 7 - shorter
result = e.calc(n1: 1, n2: 3.5, oper: {(n1:Double, n2: Double)->Double in
    return n1 * n2;
});
print(result);

//Example 8 - shorter++ (infered type)
result = e.calc(n1: 3, n2: 4.6, oper: {(n1, n2)in
    return n1 * n2;
});
print(result);

//Example 9 - mini shorter ++ (infered type & implicit return)
result = e.calc(n1: 5, n2: 1.4, oper: {(n1, n2)in n1*n2});
print(result);

//Example 10 - mini shorter++++ (infered type & implicit return & default arguments)
result = e.calc(n1: 2, n2: 3, oper: {$0*$1});
print(result);

//How many tasks
print(e.getTasksCount());





