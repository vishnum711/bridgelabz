//
//  main.swift
//  nibbleswap
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
func binary(num: Int) ->Array<Int>{
    var arr = [Int]()
    var num = num
    var i = 0
    while(num != 0){
        i = num%2
        num = num/2
        arr.append(i)
    }
    return arr
}
print("enter the no")
var num1 = readLine()
var num = Int(num1!)
var bin = binary(num: num!)
//print(bin)
bin.reverse()
print(bin)
//var k = 0
var length = 8-bin.count
var nwarr = [Int](repeating: 0, count: length)
nwarr = nwarr+bin
print(nwarr)
var left = Array(nwarr[0..<4])
var right = Array(nwarr[4...7])
var finalarr = right+left
finalarr.reverse()
var finalarr1 = finalarr
var j=0
var sum = 0
for index in finalarr1{
    sum = sum + index * Int(pow(2,Double(j)))
    j = j+1
}
print(sum)
if (sum & (sum-1) == 0){
    print("The no is a power of 2")
}else{
     print("The no is not a power of 2")
}


