//
//  main.swift
//  quadratic
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the value of a b and c")
var num1 = readLine()
var num2 = readLine()
var num3 = readLine()
var a = Float(num1!)
var b = Float(num2!)
var c = Float(num3!)
var d = b!*b!-4*a!*c!
var r1 = (-b!+sqrt(d))/(2*a!)
var r2 = (-b!-sqrt(d))/(2*a!)

print("roots are \(r1) and \(r2)")
