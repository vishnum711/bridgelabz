//
//  main.swift
//  stopwatch
//
//  Created by admin on 8/29/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
var bool =  true
while(bool){
    print("enter 1 to start")
    var no = Int(readLine()!)
    if (no == 1){
        bool = false
    }
}
var hh = Calendar.current.component(.hour, from: Date())
var mm = Calendar.current.component(.minute, from: Date())
var ss = Calendar.current.component(.second, from: Date())

var bool2 = true
while(bool2){
    print("enter 0 to stop")
    var no2 = Int(readLine()!)
    if (no2 == 0){
        bool2 = false
    }
}
var hh2 = Calendar.current.component(.hour, from: Date())
var mm2 = Calendar.current.component(.minute, from: Date())
var ss2 = Calendar.current.component(.second, from: Date())


print("time elasped is \(hh2-hh) hours \(mm2-mm) minutes \(ss2-ss) seconds")

