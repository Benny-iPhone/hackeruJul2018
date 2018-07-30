import Foundation

public class VehicleFactory{
    
    public static func createVehicle(_ type: String)->Vehicle?{
        switch type.lowercased() {
        case "car", "private":
            return PrivateCar();
        case "bus":
            return Bus();
        case "bike", "motorcycle":
            return Bike();
        default:
            return nil;
        }
    }
    
}
