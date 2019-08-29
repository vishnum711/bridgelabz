//
//  main.swift
//  calendar
//
//  Created by admin on 8/27/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class day {
    static func dayis (dt: Int, mnth: Int, yr: Int) ->Int{
        let y = yr - (14-mnth)/12
        let x = y + y/4 - y/100 + y/400
        let m = mnth + 12*((14-mnth)/12)-2
        let d = ( dt + x + 31*m/12 )%7
        return d
    }
}

print("enter the month and year respectively")
var month = readLine()
var year = readLine()
var mnth = Int(month!)
var yr = Int(year!)
var dy = day.dayis(dt: 1, mnth: mnth!, yr: yr!)
var lastdt = 31
switch mnth{
case 1,3,5,7,8,10,12:
    lastdt = 31
case 4,6,9,11:
    lastdt = 30
case 2:
    if(yr!%4 == 0){
        if((yr!%100==0)&&(yr!%400==0)){
        lastdt = 29
        }
        else{
            lastdt = 28
        }
    }
    else{
        lastdt = 28
    }
default:
    lastdt = 31
}

var calendar = Array(repeating: [0, 0, 0, 0, 0, 0, 0], count: 6)
var i = 1
while dy<7{
    calendar[0][dy] = i
    i = i+1
    dy = dy+1
}
var k = 1
while(i<=lastdt){
    for j in 0...6{
        calendar[k][j] = i
        i = i+1
        if(i>lastdt){
            break
        }
    }
    k = k+1
}
print("S\tM\tT\tW\tT\tF\tS ")
for i in 0...5{
    if(calendar[i][6] <= 14){
         print("\((calendar[i][0]))\t\(calendar[i][1])\t\(calendar[i][2])\t\(calendar[i][3])\t\(calendar[i][4])\t\(calendar[i][5])\t\(calendar[i][6])")
    }else{
    print("\(calendar[i][0])  \(calendar[i][1])  \(calendar[i][2])  \(calendar[i][3])  \(calendar[i][4])  \(calendar[i][5])  \(calendar[i][6])")
    }
}


//print("Hello, World!")

