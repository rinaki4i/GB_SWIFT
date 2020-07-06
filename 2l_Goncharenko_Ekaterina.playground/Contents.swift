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

var cacheData = [Decimal: Decimal]()

func fibNum(x:Decimal) -> Decimal{
    switch x {
    case 0,1:
        return x
    default:
        if let fibValue = cacheData[x]{
            return fibValue
        }
        let fibValue = fibNum(x: x - 1) + fibNum(x: x - 2)
        cacheData[x] = fibValue
        return fibValue
        }
    }

let x: Decimal = 45

var fibArray = [Decimal]()
for i in stride(from: x, through: x + 100, by: 1){
    fibArray.append(fibNum(x: i))
}
print(fibArray)

