//
//  main.swift
//  hashing
//
//  Created by admin on 8/27/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
let location = NSString(string: "/Users/admin/Desktop/hashing.txt").expandingTildeInPath
let filecontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
//print(filecontent)
var arr = filecontent.components(separatedBy: " ")
var arr2 = [Int]()
for i in arr{
    arr2.append(Int(i)!)
}
//var oneD = [Int]()
var twoD = Array(repeating: [Int](), count: 11)
var val = 0
    for i in arr2 {
        val = i % 11
        twoD[val].append(Int(i))
    }
print(twoD)
print("enter the no")
var no = Int(readLine()!)
var i = 0
var j = 0
var flag = 0
for i in 0..<11{
    for j in 0..<twoD[i].count{
        if (no == twoD[i][j]){
            flag = 1
           twoD[i].remove(at: j)
            break
        }
        if(flag==1){
            break
        }
        }
    }
if(flag == 0){
    val = no! % 11
    twoD[val].append(Int(no!))
}
print(twoD)
var oneD = [Int]()
for i in 0..<11{
    for j in 0..<twoD[i].count{
        if (twoD[i][j] != nil){
            oneD.append(twoD[i][j])
        }
        }
    }
//print(oneD)
var s = oneD.map{ String($0) }.joined(separator: " ")
let saveToPath = "/Users/admin/Desktop/hashing.txt"
do{
    try s.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
}
catch{
    
}
