//
//  main.swift
//  temperature
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class temp {
    static func istemp(num: Double, str: String) ->(Double,String){
        
        if(str == "c"){
            var faren:Double = Double((num*9))/5 + 32
            return(faren,"F")
        }
        else{
            var celc:Double = Double((num-32)*5)/9
            return(celc,"C")
        }
    }
}



print("enter temp and mention whetrher it is in c or f")
var num1 = readLine()
var num = Double(num1!)
var tempin = readLine()
var str = String(tempin!)
print(temp.istemp(num: num!, str: str))
