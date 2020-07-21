import UIKit

/* Homework for GeekBrains*/

// Lesson 7. Ex.1-2.
protocol Machinery {
    var machinery: Dictionary<String, Int> { get set }
}

enum SystemErrors: Error {
    case noValidEquipment(vehicle: String)
    case blockNegativePosition(vehicle: String, value: Int)
}

class MiningMachinery: Machinery {
    internal var machinery = [
        "Excavator": 5,
        "Dump Truck": 42,
        "Bulldozer": 3,
        "Grader": 1]
    func amountOfequipment(atName Name: String) -> (Int?, SystemErrors?) {
        guard machinery[Name] != nil else {
            return (nil, SystemErrors.noValidEquipment(vehicle: Name))
        }
        return  (machinery[Name], nil)
    }
    func changeValue(atName: String, atValue: Int) throws -> Int? {
        guard let _ = machinery[atName] else {
            throw SystemErrors.noValidEquipment(vehicle: atName)
        }
        guard atValue >= 0 else {
            throw SystemErrors.blockNegativePosition(vehicle: atName, value: atValue)
        }
        return machinery.updateValue(atValue, forKey: atName)
    }
}
let miningMachinery = MiningMachinery()
let vehicle1 = miningMachinery.amountOfequipment(atName: "Excavator4")


if let truck = vehicle1.0{
    print("Количество техники: \(truck)")
}else if let error = vehicle1.1 {
    print("Сбой системы - \(error)")
}

do {
    let _ = try miningMachinery.changeValue(atName: "Grader", atValue: -26)
} catch let error {
    print(error)
}

let vehicle2 = miningMachinery.amountOfequipment(atName: "Grader")
if let truck = vehicle2.0{
    print("Количество техники: \(truck)")
}else if let error = vehicle2.1 {
    print("Сбой системы - \(error)")
}
