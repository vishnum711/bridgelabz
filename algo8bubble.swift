//
//  main.swift
//  bubble_sort
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the array")
var num = readLine()
var num1 = Int(num!)
var arr = [Int]()
for _ in 0...num1!-1 {
    print("enter the no for array and press enter")
    var num2 = readLine()
    var num3 = Int(num2!)
    arr.append(num3!)
}
func bubble(array: Array<Any>) -> Array<Any>{
   var issorted = true
    while(issorted){
        issorted = false
        for i in 0...arr.count-2 {
            if(arr[i]>arr[i+1]){
                arr.swapAt(i, i+1)
                issorted = true
            }
        }
    
    }
    return arr
}

print(bubble(array: arr))
