//
//  main.swift
//  flipcoin
//
//  Created by BridgeLabz on 20/08/19.
//  Copyright © 2019 Bridgelabz. All rights reserved.
//

import Foundation
print("no of tosses required")
//var number = readLine()
 let input = readLine()
var no = Int(input!)
var num = 1
var sum:Float = 0
while num<=no!
{
 let fraction = Float.random(in: 0..<1)
    sum += fraction
    num += 1
}
var probab = 100*(sum/Float(no!))
probab.round(.down)
if probab<50{
  print("probability of tails is \(probab) ")
    print("probability of heads is \(100-probab) ")
}
else{
    print("probability of heads is \(probab) ")
    print("probability of tails is \(100-probab) ")
}


