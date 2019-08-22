//
//  main.swift
//  vending_mach
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the amount")
var num = readLine()
var num1 = Int(num!)
let arr = [ 1000, 500, 100, 50, 10, 5, 2, 1 ]
var arr2 = [Int]()
func vending(money: Int, arr: Array<Int>) -> Array<Any>{
    var i=0
    var amnt = money
    while(amnt != 0){
            arr2.append(amnt/arr[i])
            amnt = amnt % arr[i]
        i=i+1
    }
    return arr2
}
var notes = vending(money: num1!, arr: arr)
print("thousands= \(notes[0]) fivehundreds = \(notes[1]) hundreds = \(notes[2]) fifties= \(notes[3]) tens = \(notes[4]) fives = \(notes[5]) twos= \(notes[6]) ones= \(notes[7])")

