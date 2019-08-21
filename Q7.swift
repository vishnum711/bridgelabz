//
//  main.swift
//  gambling
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("enter stake, goal and no of times you want to trial" )
var stake = readLine()
var goal = readLine()
var not = readLine()
var stk = Int(stake!)
var gol = Int(goal!)
var nt = Int(not!)
var wins = 0
for itrn in 0..<nt! {
    
    var cash = stk!
    while(cash>0 && cash < gol!){
        var fraction = Float.random(in: 0..<1)
    if (fraction<0.5){
        cash += 1}
    else{
        cash -= 1
        }
    }
    if(cash==gol!){
        wins += 1
    }
}
print("wins= \(wins) trials= \(nt!) wins percentage= \(100*wins/nt!)")
