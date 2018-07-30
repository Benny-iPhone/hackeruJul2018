import Foundation

public class Computer{
    
    private let cpu: CPU;
    private let memory: Memory;
    private let hdd: HardDrive;
    
    public init(){
        cpu = CPU();
        memory = Memory();
        hdd = HardDrive();
    }
    
    public func start(){
        cpu.execute("Computer start");
        cpu.execute(memory.load(hdd.read()));
    }
    
    public func shutDown(){
        cpu.execute("Computer Shutting Down");
    }
    
}
