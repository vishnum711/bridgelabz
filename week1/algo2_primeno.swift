//
//  main.swift
//  prime_nos
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter the no below which prime nos are required")

class Primenos{
   static func isPrimeno(num:Int) -> Void {
        for i in 2..<num{
          var  k=2
            var flag=0
            while(k*k <= i){
                if(i%k == 0){
                    flag=1
                    break;
                }
                k = k+1
                }
            if(flag==0){
                print(i)
            }
            
        }
    }
}
print("enter the no")
var N = readLine()
var num = Int(N!)
Primenos.isPrimeno(num: num!)
