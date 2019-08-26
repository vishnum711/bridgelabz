//
//  main.swift
//  monthlypayment
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
func monthlypay(p: Double, R: Double, y: Double) ->Double{
    var r = R/(12*100)
    var n = 12*y
    var mp = (p*r)/(1-pow((1+r),-n))
    return mp
}
print("enter p r and y respectively")
var princpl = readLine()
var rate = readLine()
var yr = readLine()
var p = Double(princpl!)
var R = Double(rate!)
var y = Double(yr!)
print(monthlypay(p: p!, R: R!, y: y!))

