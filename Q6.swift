//
//  main.swift
//  prime_factors
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the no")
var N = readLine()
var num = Int(N!)
var i=2
while(i*i <= num!){
    if(num! % i == 0){
        print(i)
    }
    i = i+1
}

