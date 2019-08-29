//
//  main.swift
//  DSbst
//
//  Created by admin on 8/28/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

func binomial(_ num: Int) ->Int{
    var bs = Array(repeating: 0, count: num+1)
    bs[0] = 1
    bs[1] = 1
    for i in 2...num{
        for j in 0..<i{
            bs[i] = bs[i] + ((bs[j]%10000007)*(bs[i-j-1]%10000007))%10000007
        }
    }
return bs[num]
}
print("enter the no")
var num = Int(readLine()!)
var bst = (binomial(num!))
print(bst)
