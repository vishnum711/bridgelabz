//
//  main.swift
//  word_binary_search
//  question no 6 algorithm programs
//  Created by admin on 8/23/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
func binary(tosearch: String,arr: Array<String>) ->Void{
    var firstindex = 0
    var lastindex = arr.count-1

    while(firstindex<=lastindex){
      var  middleindex = (firstindex+lastindex)/2
        if(tosearch==arr[middleindex]){
            print("the word is present")
            break
        }
        if(tosearch<arr[middleindex]){
            lastindex = middleindex-1
        }
        if(tosearch>arr[middleindex]){
            firstindex = middleindex+1
        }
        
    }
    
    
}





print("enter the size of array")
var num = readLine()
var num2 = Int(num!)
var arr = [String]()
for i in 0..<num2! {
    var str = readLine()
    var str2 = String(str!)
    arr.append(str2)
}
print(arr)
var arrsort = arr.sorted()
print(arrsort)
print("enter the word you want to search")
var str3 = readLine()
var str4 = String(str3!)
binary(tosearch: str4, arr: arrsort)
