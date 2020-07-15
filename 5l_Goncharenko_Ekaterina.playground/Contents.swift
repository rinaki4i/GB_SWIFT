import UIKit

/* Homework for GeekBrains
Lesson 5 */

protocol Car {
    var km: UInt { get set }
    var color: UIColor { get set }
    var brand: String { get }
    func doorState()
}

extension Car {
    func engineOperations(signal: String) -> Bool {
        switch signal {
        case "Включить":
            print("Двигатель включен")
            return true
        case "Выключить":
            print("Двигатель выключен")
            return false
        default:
            print("Невозможно распознать сигнал: \(signal).  Двигатель отключен")
            return false
        }
    }
}
extension Car {
func doorsState(action: String) -> Bool {
    switch action {
    case "Открыть":
        print("Окна открыты")
        return true
    case "Закрыть":
        print("Окна закрыты")
        return false
    default:
        print("Невозможно распознать сигнал: \(action).  Окна закрыты")
        return false
        }
    }
}

class SportCar: Car {
    func doorState() {
        print("какое-то состояние дверей")
    }
    var km: UInt
    var color: UIColor
    var brand: String
    var accelerationTime: Double
    init(km: UInt, color: UIColor, brand: String, accelerationTime: Double) {
        self.accelerationTime = accelerationTime
        self.brand = brand
        self.color = color
        self.km = km
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Я \(brand) с пробегом \(km) километров и разгоняюсь за \(accelerationTime) секунд"
    }
}

class TankCar: Car {
    func doorState() {
        print("какое-то состояние дверей")
    }
    var km: UInt
    var color: UIColor
    var brand: String
    var carryingCapacity: UInt
    init(km: UInt, color: UIColor, brand: String, carryingCapacity: UInt) {
        self.carryingCapacity = carryingCapacity
        self.brand = brand
        self.color = color
        self.km = km
    }
}

extension TankCar: CustomStringConvertible {
    var description: String {
        return "Я автоцистерна \(brand) с пробегом \(km) километров и я могу перевезти \(carryingCapacity) литров"
    }
}

var sport = SportCar(km: 5678, color: .black, brand: "Ferrari", accelerationTime: 1.5)
var tank = TankCar(km: 4589, color: .darkGray, brand: "CAPRI PC-17", carryingCapacity: 15000)

print(sport)
print(tank)
sport.doorsState(action: "Открыть")
sport.accelerationTime = 2.5
print(sport)
sport.doorsState(action: "Сезам, закройся!")
sport.engineOperations(signal: "чуть-чуть заведи двигатель")
sport.engineOperations(signal: "Включить")
tank.carryingCapacity = 12000
tank.doorsState(action: "Закрыть")
print(tank)
tank.engineOperations(signal: "Открыть")


