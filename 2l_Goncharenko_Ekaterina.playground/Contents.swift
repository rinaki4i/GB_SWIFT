// Homework for GeekBrains

import Foundation

// Lesson 2. Ex. 1

func isEvenOrNot(Digit:Int64) -> String{
    let even = Digit%2
    if even == 0{
        return("Digit \(Digit) is even")
    }else{
        return("Digit \(Digit) is odd")

    }
}
print(isEvenOrNot(Digit: 8))

func isEvenOrNot2(Digit:Int64){
    let even = Digit%2
    if even == 0{
        print("Digit \(Digit) is even")
    }else{
        print("Digit \(Digit) is odd")
    }
}

isEvenOrNot2(Digit: 89)

func isEvenOrNot3(Digit:Int64){
    let even = Digit%2
    even == 0 ? print("Digit \(Digit) is even"):print("Digit \(Digit) is odd")
}

isEvenOrNot3(Digit: 89)

// Lesson 2. Ex. 2

func del3(Number:Int64) -> String{
    let y = Number%3
    if y == 0{
        return("Number \(Number) is divided")
    }else{
        return("Number \(Number) is undivided")
    }
}

print (del3(Number: 6654))

// Lesson 2. Ex. 3

var range_digit = [Int]()
for i in 1...100{
    range_digit.append(i)
}
print(range_digit)

// Lesson 2. Ex. 4

range_digit.removeAll(where:{ $0 % 2 == 0 })
range_digit.removeAll(where:{ $0 % 3 != 0 })
print(range_digit)

// Lesson 2. Ex. 5
// Не понятно, как преодолеть ограничение в Int64.max и почему идет краш, если сделать х - отрицательным числом. И не очень понятно, почему не вышло обработать ошибку

var cacheData = [Int64: Int64]()

func fibNum(x:Int64) throws -> Int64{
    switch x {
    case 0,1:
        return x
    default:
        if let fibValue = cacheData[x]{
            return fibValue
        }
        
//        let prev = cacheData[x - 1], prevPrev = cacheData[x - 2]
//        if ( prev != nil && prevPrev != nil ){
//            do {
//                let fibValue = try (fibNum(x: x - 1) + fibNum(x: x - 2))
//                cacheData[x] = fibValue
//                return fibValue
//            } catch {
//                return Int64.max
//            }
//        }
        let fibValue = try fibNum(x: x - 1) + fibNum(x: x - 2)
        cacheData[x] = fibValue
        return fibValue
        }
    }

let x: Int64 = 10

var fibArray = [Int64]()
// не выходит дойти до 100 из-за проблем с INT64_MAX
for i in x...x + 82{
    fibArray.append(try fibNum(x: i))
}
print(fibArray)

