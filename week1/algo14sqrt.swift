//
//  main.swift
//  sqrt_using_newtonsmthd
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class sqrt{
    static func issqrt(num: Double) ->Double{
        var t = num
        while(abs(t-num/t) > t*pow(M_E, -15)){
            t = (t + num/t)/2
        }
        return t
    }
}



print("enter the no")
var num1 = readLine()
var num = Double(num1!)
var no = sqrt.issqrt(num: num!)
print("the sqrt of no is \(no)")

