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
                if trunkState == .empty && newValue.get() <= trunkVolume {
                    changeTrunk(operations: newValue.caseName(), newValue: newValue.get(), oldValue: <#T##Double#>, maxSize: trunkVolume)
                    print("В багажник загружено \(newValue.get()) литров")
                }else if newValue.get() > trunkVolume {
                    print("Нельзя загрузить в багажник вещей (\(newValue.get())) больше предельного объема \(trunkVolume)!")
                }
            }
            if newValue.caseName() == "unload"{
                print(trunkVolume - newValue.get())
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


car1.color = .purple
car2.color
car1.operationsWithTrunk = .load(cargoSize: 70)
car1.operationsWithTrunk = .load(cargoSize: 99)
car1.trunkVolume = 382
car2.trunkVolume
car1.windowsState
car2.windowsState = .closed
car2.windowsState

