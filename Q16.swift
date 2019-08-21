//
//  main.swift
//  windchill
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter temp and wind speed respectively")
var num1 = readLine()
var num2 = readLine()
var t = Double(num1!)
var v = Double(num2!)
if(Int(t!)<50&&(Int(v!)>3 && Int(v!)<120)){
var p = pow(v!,0.16)
var w = 35.74 + 0.6215*t! + (0.4257*t!-35.75)*p
print(w)
}
else{
    print("pls enter an accurate range")
}
