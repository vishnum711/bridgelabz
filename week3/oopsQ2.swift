//
//  main.swift
//  oopsq2
//
//  Created by admin on 9/4/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
//finding the curent date------------------------------------------------------------------------------
let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd/MM/yyyy"
let currDate = formatter.string(from: date)
//print(currDate)
//-- get the user input of name and mob no--------------------------------------------------------------
print("enter your name")
var name = String(readLine()!)
print("enter your full name")
var fname = String(readLine()!)
print("enter your mobile no")
var mob = String(readLine()!)
//------------reading information from the sublime text------------------------------------------------
let location = NSString(string: "/Users/admin/Desktop/input.txt").expandingTildeInPath
do{
    var filecontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
print(filecontent)
//replacing cntents of information with the entered values---------------------------------------------
    filecontent = filecontent.replacingOccurrences(of: "<<name>>", with: name) as NSString
    filecontent = filecontent.replacingOccurrences(of: "<<full name>>", with: fname) as NSString
    filecontent = filecontent.replacingOccurrences(of: "xxxxxxxxxx", with: mob) as NSString
    filecontent = filecontent.replacingOccurrences(of: "01/01/2016", with: currDate) as NSString
    print(filecontent)
}
catch {
    print("not found")
}

