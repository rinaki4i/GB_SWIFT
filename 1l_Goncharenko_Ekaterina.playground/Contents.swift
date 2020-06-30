// Homework for GeekBrains

import Foundation

// Lesson 1. Ex.1

var a = 5
var b = 50
var c = 7

let d = b*b-4*a*c
if (d>0){
    let x1: Double = (Double(-b) + sqrt(Double(d)))/2 * Double(a)
    let x2: Double = (Double(-b) - sqrt(Double(d)))/2 * Double(a)
    print("Root 1 is \(x1)\nRoot 2 is \(x2)")
} else if (d<0){
    print("Function hasn't solutions")
} else if (d==0){
    let x: Double = (Double(-b) + sqrt(Double(d)))/2 * Double(a)
    print("Root is \(x)")
}

//Lesson 1. Ex.2

var catet1: UInt = 9
var catet2: UInt = 6

let S = (catet1 * catet2)/2
let gip = UInt(sqrt(Double(catet1 * catet1 + catet2 * catet2)))
let P = catet1 + catet2 + gip
    print("Area is \(S)\nHypotenuse is \(gip)\nPerimeter is \(P)")

//Lesson 1. Ex.3

var deposit: Double = 156000.25
var percent: Double = 4.5
var years = 5

if deposit <= 0{
    print("Deposit must be more than 0")
    exit(1)
}

let amount = ((((deposit/100) * percent) * Double(years)) + deposit)
    print("Amount in \(years) years is \(amount) denyak")
