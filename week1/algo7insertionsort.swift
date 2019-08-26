//
//  main.swift
//  insertion_sort
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the size of array")
var num = readLine()
var num1 = Int(num!)
var arr = [Int]()
for _ in 0...num1!-1{
    var num2 = readLine()
    var num3=Int(num2!)
    arr.append(num3!)
}
var num4 = arr.count
for i in 1...num4-1 {
    var key = arr[i]
    var j = i-1
    while(j>=0 && arr[j]>key){
        arr[j+1] = arr[j]
        j=j-1
    }
    arr[j+1]=key
    
    
}
print(arr)
