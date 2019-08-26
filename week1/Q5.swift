//
//  main.swift
//  sum_of_n_harmonics
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the value of N")
var N = readLine()
var num = Int(N!)
var sum: Float = 0.0
//var i = 1
for itr in 1...num! {
    sum = sum + 1/Float(itr)
}
print(sum)
