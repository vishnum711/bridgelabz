//
//  main.swift
//  distance
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the co-ordinates x and y")
var num1 = readLine()
var num2 = readLine()
var x = Double(num1!)
var y = Double(num2!)
var z:Double = x!*x! + y!*y!
var distance = sqrt(z)
print(distance)

