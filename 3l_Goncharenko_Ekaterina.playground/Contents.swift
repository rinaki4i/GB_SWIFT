import UIKit

//Lesson 3.

enum trunk {
    case full, empty, incomplete
    }

enum engineCondition{
    case on, off
}

enum windowsConditions {
    case opened, closed
}

enum trunkOperations {
    case load(cargoSize: Double), unload(cargoSize: Double)
    
    func caseName() -> String {
        switch self {
        case .load(cargoSize: _):
            return "load"
        case .unload(cargoSize: _):
            return "unload"
        }
    }
    
    func get() -> Double {
        switch self {
        case .load(cargoSize: let cargoValue):
            return cargoValue
        case .unload(cargoSize: let cargoValue):
            return cargoValue
        }
    }
}

struct  carsVariations{
    let brand: String
    let model: String
    var year: Int64
    var color: UIColor
    var trunkVolume: Double
    mutating func changeTrunk(operations: String, newValue: Double, oldValue: Double, maxSize: Double) {
        switch operations {
        case "load":
            if newValue > 0 && newValue < maxSize && (self.trunkState == .empty || self.trunkState == .incomplete) {
                self.trunkState = .incomplete
            } else if (newValue == maxSize && self.trunkState == .empty) || (self.trunkState == .incomplete && (oldValue + newValue == maxSize)){
                self.trunkState = .full
            }
        case "unload":
            if newValue > 0 && newValue < maxSize && (self.trunkState == .full || self.trunkState == .incomplete) {
                self.trunkState = .incomplete
            } else if newValue == maxSize || (self.trunkState == .incomplete && (oldValue + newValue == maxSize)) {
                self.trunkState = .empty
            }
        default:
            print("input error! Check value operations: \(operations)")
        }
    }
    
    var operationsWithTrunk: trunkOperations {
        willSet {
            if newValue.caseName() == "load"{
                let commonLoadSize = newValue.get() + operationsWithTrunk.get()
                if trunkState == .empty && newValue.get() <= trunkVolume {
                    changeTrunk(operations: newValue.caseName(), newValue: newValue.get(), oldValue: operationsWithTrunk.get(), maxSize: trunkVolume)
                    print("В багажник \(brand) \(model) загружено \(newValue.get()) литров, общий размер: \(commonLoadSize)")
                }else if (newValue.get() + operationsWithTrunk.get()) > trunkVolume {
                    print("Нельзя загрузить в багажник \(brand) \(model) объектов (\(commonLoadSize)) больше предельного объема \(trunkVolume)!")
                }
            }
            if newValue.caseName() == "unload"{
                if trunkState == .full && newValue.get() <= trunkVolume {
                    let commonUnloadSize = trunkVolume - newValue.get()
                    changeTrunk(operations: newValue.caseName(), newValue: newValue.get(), oldValue: operationsWithTrunk.get(), maxSize: trunkVolume)
                    print("Из багажника \(brand) \(model) выгружено \(newValue.get()) литров, общий размер в остатке: \(commonUnloadSize)")
                }else if trunkState == .empty {
                    print("Нельзя ничего выгрузить из \(brand) \(model) - багажник пустой!")
                }
                }
            }
        }
    
    var trunkState: trunk {
     willSet {
        if newValue == .full {
            print("Багажник \(brand) \(model) загружен полностью")
        } else if newValue == .empty {
            print("Багажник \(brand) \(model) пуст")
        } else {
            print("В багажнике \(brand) \(model) что-то есть")
        }
        
        }
    }
    
    var engineState: engineCondition {
        willSet {
            if newValue == .on {
                print("Двигатель \(brand) \(model) запущен")
                } else {
                    print("Двигатель \(brand) \(model) отключен")
                }
            }
        }
    
    var windowsState: windowsConditions {
        willSet {
            if newValue == .opened {
                print("В данный момент окна \(brand) \(model) открыты")
            } else {
                print("В данный момент окна \(brand) \(model) закрыты")
            }
        }
    }
}

var car1 = carsVariations(brand: "Ford", model: "Mustang Shelby", year: 2017, color: .black, trunkVolume: 382.0, operationsWithTrunk: .load(cargoSize: 40), trunkState: .empty, engineState: .off, windowsState: .closed)
var car2 = carsVariations(brand: "Jaguar", model: "E-Pace", year: 2020, color: .red, trunkVolume: 332.0, operationsWithTrunk: .unload(cargoSize: 50), trunkState: .full, engineState: .off, windowsState: .opened)
var truck1 = carsVariations(brand: "BelAZ", model: "75570", year: 2015, color: .orange, trunkVolume: 90000.0, operationsWithTrunk: .load(cargoSize: 40000), trunkState: .empty, engineState: .on, windowsState: .closed)
var truck2 = carsVariations(brand: "Hitachi", model: "EH5000AC-3", year: 2013, color: .red, trunkVolume: 326000.0, operationsWithTrunk: .unload(cargoSize: 50000), trunkState: .full, engineState: .off, windowsState: .opened)


car1.color = .purple
car2.color
car1.operationsWithTrunk = .load(cargoSize: 150)
car2.operationsWithTrunk = .unload(cargoSize: 170)
car2.operationsWithTrunk = .load(cargoSize: 250)
truck1.operationsWithTrunk = .load(cargoSize: 150)
truck2.operationsWithTrunk = .unload(cargoSize: 156000)
truck1.operationsWithTrunk = .load(cargoSize: 7000000)
car1.trunkVolume
car2.trunkVolume
car1.windowsState
car2.windowsState = .closed
car2.windowsState
truck2.trunkVolume
truck1.trunkVolume
truck1.windowsState
truck2.windowsState = .closed
truck2.windowsState
