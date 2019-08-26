//
//  main.swift
//  two_D_array
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
print("enter the dimensions of array")
var num = readLine()
var M = Int(num!)
var num2 = readLine()
var N = Int(num2!)
var arr = Array(repeating: Array(repeating: 0, count: N!), count: M!)
if(M!>N!){
    for i in 0..<M! {
        for j in 0..<N! {
            var num3 = readLine()
            var num4 = Int(num3!)
            arr[i][j] = num4!
        }
    }
}
if(M!<N!){
    for i in 0..<N! {
        for j in 0..<M! {
            var num3 = readLine()
            var num4 = Int(num3!)
            arr[i][j] = num4!
        }
    }
}


print(arr)
