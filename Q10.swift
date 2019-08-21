//
//  main.swift
//  triplets
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the size of array")
var N = readLine()
var num = Int(N!)
var arr = [Int]()
var i = 0
var j = 0
var count=0


while i<num! {
    var no = readLine()
    var ip = Int(no!)
    arr.append(ip!)
    i = i+1
}

print(arr)

while (j<num!){
    var k = j+1
    while(k<num!){
        var l = k+1
        while(l<num!){
           var sum = arr[j]+arr[k]+arr[l]
            if(sum==0){
               print("the triplets are \(arr[j]) \(arr[k]) \(arr[l]) ")
                count = count+1
            }
            l=l+1
            }
        k=k+1
    }
    
    j = j+1
}
print(count)

