import UIKit

// Lesson 4.

enum engineCondition{
    case on, off
    
    func printState(brand: String){
        switch self {
        case .on:
            print("Двигатель \(brand) включен")
        case .off:
            print("Двигатель \(brand) выключен")
        }
    }
}

enum windowsConditions {
    case opened, closed
}

enum carCase {
   case up, down
}

enum carHingedRoof {
    case on, off
}

class cars {
    let brand: String
    let color: UIColor
    let year: Int64
    var speedLimit: Double
    var km: Double
    var windowsState: windowsConditions
    var engineState: engineCondition {
        didSet {
            oldValue.printState(brand: brand)
        }
        willSet {
            newValue.printState(brand: brand)
        }
    }
    init(brand: String, color: UIColor, year: Int64, speedLimit: Double, km: Double, windowsState: windowsConditions, engineState: engineCondition) {
        self.brand = brand
        self.year = year
        self.color = color
        self.speedLimit = speedLimit
        self.km = km
        self.windowsState = windowsState
        self.engineState = engineState
    }
    
    func blaBla() {
        print("Трансформируемся!")
    }
    
    func printInfo(){
        print("Данные по модели - модель: \(brand), год выпуска: \(year), скоростной предел: \(speedLimit) км, пробег: \(km) км, режим двигателя \(engineState), состояние окон: \(windowsState)")
    }
}

class sportCar: cars {
    var accelerationTime: Double
    var carRoof:carHingedRoof
    init(brand: String, color: UIColor, year: Int64, speedLimit: Double, km: Double, windowsState: windowsConditions, engineState: engineCondition, accelerationTime: Double, carRoof: carHingedRoof) {
        self.accelerationTime = accelerationTime
        self.carRoof = carRoof
        super.init(brand: brand, color: color, year: year, speedLimit: speedLimit, km: km, windowsState: windowsState, engineState: engineState)
    }
    
    override func blaBla() {
        print("Десептиконы, вперёд!")
    }
}

class truckCar: cars {
    var carryingCapacity: Double
    init(brand: String, color: UIColor, year: Int64, speedLimit: Double, km: Double, windowsState: windowsConditions, engineState: engineCondition, carryingCapacity: Double) {
        self.carryingCapacity = carryingCapacity
        super.init(brand: brand, color: color, year: year, speedLimit: speedLimit, km: km, windowsState: windowsState, engineState: engineState)
        }
    
    override func blaBla() {
        print("Автоботы, вперёд!")
        }
}

var baseCar = cars(brand: "Ferrari", color: .red, year: 2019, speedLimit: 350.5, km: 2000.0, windowsState: .opened, engineState: .off)

var megaTron = sportCar(brand: "Deseptikon", color: .darkGray, year: 2, speedLimit: 600, km: 7000000, windowsState: .closed, engineState: .on, accelerationTime: 5, carRoof: .off)

var optimusPrime = truckCar(brand: "Autobot", color: .blue, year: 2, speedLimit: 300, km: 7000000, windowsState: .closed, engineState: .off, carryingCapacity: 600000)

baseCar.blaBla()
baseCar.printInfo()
print("марка базовой модели -  \(baseCar.brand)")
print("пробег базовой модели - \(baseCar.km) км")
baseCar.engineState = .on
megaTron.printInfo()
megaTron.blaBla()
print("пробег десептикона - \(megaTron.km) км")
baseCar.km = 3000
print("пробег базовой модели стал - \(baseCar.km) км")
megaTron.km =  900000
print("пробег десептикона стал - \(megaTron.km) км")
optimusPrime.printInfo()
optimusPrime.blaBla()
optimusPrime.engineState = .on





