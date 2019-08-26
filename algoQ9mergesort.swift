//
//  main.swift
//  mergesort1
//
//  Created by admin on 8/24/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
func mergesort(arr: [Int]) ->[Int]{
    
    guard arr.count > 1 else{
        return arr
    }
    var left = Array(arr[0..<arr.count/2])
    var right = Array(arr[arr.count/2..<arr.count])
    
    return merge(left: mergesort(arr: left), right: mergesort(arr: right))
}

func merge(left: [Int], right: [Int]) ->[Int]{
    var mergedarr = [Int]()
    var left = left
    var right = right
    while left.count>0 && right.count>0 {
    if(left[0]>right[0]){
        mergedarr.append(right.removeFirst())
    }
    else{
        mergedarr.append(left.removeFirst())
        }
    }
    mergedarr = mergedarr + left + right
    return mergedarr
}
print("enter the array size")
var arrsze = readLine()
var arrsze1 = Int(arrsze!)
print("enter the array elements")
var arr = [Int]()
for _ in 0..<arrsze1!{
 var arrelmnt = readLine()
    var arrelmnt1 = Int(arrelmnt!)
    arr.append(arrelmnt1!)
}

print(arr)
print(mergesort(arr: arr))


