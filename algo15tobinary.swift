//
//  main.swift
//  tobinary
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
func tobinary(num: Int) ->Int {
    var n:Int=1
    var binary = 0
    var num = num
    var i = 0
    while(num > 0){
        i = num%2
        num = num/2
       
        binary = binary + n*i
         n = n*10
    }
    return binary
}
print("enter the no")
var num1 = readLine()
var num = Int(num1!)
print(tobinary(num: num!))

