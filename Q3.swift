//
//  main.swift
//  leap_year
//
//  Created by BridgeLabz on 20/08/19.
//  Copyright © 2019 Bridgelabz. All rights reserved.
//

import Foundation
print("enter the year")
var year = readLine()
var num = Int(year!)
if(num!%4 == 0){
    if((num!%100==0)&&(num!%400==0)){
        print("the year entered is leap")
    }
    else{
    print("not a leap year")
    }
}
else{
    print("not a leap year")
}
