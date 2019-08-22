//
//  main.swift
//  anagram
//
//  Created by admin on 8/22/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Anagram{
    func isAnagram(name:String,name2:String) ->Bool{
        if(name.count != name2.count){
            return false
        }
        var n1 = name.lowercased()
        var n2 = name2.lowercased()
        
        if(n1.sorted()==n2.sorted()){
            return true
        }else{
            return false
        }
    }
}
print("enter strings")
var str1 = readLine()
var str2 = readLine()
var name = String(str1!)
var name2 = String(str2!)
var result = Anagram()
var result2 = result.isAnagram(name: name, name2: name2)
if(result2){
    print("the string is anagram")
}
else{print("not anagram")}


