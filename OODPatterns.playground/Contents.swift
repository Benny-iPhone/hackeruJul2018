//Singleton usage
let s1 = MySingy.getInstance();
let s2 = MySingy.getInstance();
print(s1 === s2);

let s21 = MySingy2.instance;
let s22 = MySingy2.instance;
print(s21 === s22);

//Factory method usage
let vehicles = [
    VehicleFactory.createVehicle("Bike")!,
    VehicleFactory.createVehicle("BIKE")!,
    VehicleFactory.createVehicle("MotorCycle")!,
    VehicleFactory.createVehicle("bus")!,
    VehicleFactory.createVehicle("car")!,
];
for v in vehicles{
    v.drive();//polymorphic call
}

//Builder usage:
Rect().x(7).y(8).width(10).height(20).show();
Rect().width(10).color("Red").height(20).show();
Rect().size(width: 100, height: 50).color("Blue").show();

//Flyweight usage
let img1 = MyImage.getImage("bubu.jpg");
let img2 = MyImage.getImage("bubu.jpg");
img1.show();

//Facade
let mac = Computer();
mac.start();
mac.shutDown();













