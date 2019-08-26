//
//  main.swift
//  gyess_the_no
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter N ")
var num = readLine()
var N = Double(num!)
let num1 = pow(2.0,(N!))-1
var arr = [Int]()
for i in 0...Int(num1){
    arr.append(i)
}
func guess(N: Double,arr: Array<Any>) ->Void{
    var firstindex = 0
    var lastindex = arr.count
   
    while(firstindex<lastindex){
         var middleindex:Int = (firstindex+lastindex)/2
        print("is the no equal to \(arr[middleindex])")
        var bool1 = readLine()
        var bool2 = Bool(bool1!)
        if(bool2!){
            print(" your no is \(arr[middleindex])")
            break
        }
        print("is the no less than \(arr[middleindex])")
        var bool3 = readLine()
        var bool4 = Bool(bool3!)
        if(bool4!){
            lastindex = middleindex-1
        }
        if(!bool4!){
            firstindex = middleindex+1
        }
        if(firstindex==lastindex){
            print("your no is to \(arr[firstindex])")
        }
        
        
    }
    
    
}
guess(N: N!, arr: arr)

