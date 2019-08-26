//
//  main.swift
//  daysofweek
//
//  Created by admin on 8/23/19.
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




print("enter the date month and year respectively")
var date = readLine()
var month = readLine()
var year = readLine()
var dt = Int(date!)
var mnth = Int(month!)
var yr = Int(year!)
var daycalculated = day.dayis(dt: dt!, mnth: mnth!, yr: yr!)
switch daycalculated
{
case 0:
    print("sunday")
case 1:
    print("monday")
case 2:
    print("tuesday")
case 3:
    print("wednesday")
case 4:
    print("thursday")
case 5:
    print("friday")
case 6:
    print("saturday")
default:
    print(" ")
}
