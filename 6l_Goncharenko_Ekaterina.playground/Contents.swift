import UIKit
/* Homework for GeekBrains
 Lesson 6*/

protocol MineralsWeight {
    func weight() -> UInt
}

class Minerals: MineralsWeight {
    var trackVolume: UInt
    var runsAmount: UInt
    func weight() -> UInt {
        return trackVolume * runsAmount
    }
    init(trackVolume: UInt, runsAmount: UInt) {
        self.trackVolume = trackVolume
        self.runsAmount = runsAmount
    }
}

struct Queue <Mining: MineralsWeight> {
    private var earthGoods: [Mining] = []
    mutating func enqueue(_ earthGood: Mining) {
        earthGoods.append(earthGood)
    }
    mutating func dequeue() -> Mining? {
        return earthGoods.removeFirst()
    }
    subscript(elements: UInt ...) -> UInt? {
        var weight: UInt = 0
        var errorArray: [UInt] = []
        var goodArray: [UInt] = []
        let queueCount = self.earthGoods.count
        if let _ = elements.max() {
            for i in elements where i < queueCount {
                weight += self.earthGoods[Int(i)].weight()
                goodArray.append(i)
            }
            for i in elements where i >= queueCount {
                errorArray.append(i)
            }
        }
        if !errorArray.isEmpty {
            if weight > 0 {
                print("from elements at index \(goodArray), total weight is \(weight)")
            }
            print("element/s at index/s \(errorArray) dont/doesnt")
            return nil
        }
        return weight
    }
}

var coal = Queue<Minerals>()
coal.enqueue(Minerals(trackVolume: 15, runsAmount: 50))
coal.enqueue(Minerals(trackVolume: 18, runsAmount: 60))
coal.dequeue()
coal.enqueue(Minerals(trackVolume: 15, runsAmount: 45))
coal.enqueue(Minerals(trackVolume: 22, runsAmount: 80))
coal[7,1,2,3,4]
coal[8]
print(coal[0]!)
print(coal[0,1,2]!)
