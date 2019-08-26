//
//  main.swift
//  power_of_N
//
//  Created by BridgeLabz on 20/08/19.
//  Copyright © 2019 Bridgelabz. All rights reserved.
//

import Foundation
print("enter the power less than 31")
var num = readLine()
var powernum = Int(num!)
var i = 1
var n = 1
while(i <= powernum!){
    n = n*2
    i=i+1
    print(n)
}
if(n%4 == 0){
    print("the year is leap")
}
else{
    print("the year is not leap")

}
