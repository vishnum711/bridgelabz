//
//  main.swift
//  distinctno
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the no")
var n = readLine()
var num = Int(n!)
var arr = [Bool](repeating: false, count: num!)
var arr2 = [Bool](repeating: true, count: num!)
var bl = true
var counter=0
while(bl){
    counter = counter+1
    var rand = Int.random(in: 0..<num!)
    if(arr[rand]==false){
        arr[rand]=true
    }
    if(arr==arr2){
       // bl = false
        break
    }
}
print(counter)
