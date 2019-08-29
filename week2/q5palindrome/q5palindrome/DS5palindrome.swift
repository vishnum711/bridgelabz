//
//  main.swift
//  q5palindrome
//
//  Created by admin on 8/27/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class queue{
    var str1 = [String]()
    func enque(_ str:String){
        for i in str {
          str1.append(String(i))
            
        }
    }
    
    
        func deque() ->[String]{
        var count = str1.count
            var dequearr = [String]()
            for i in 0..<count{
                var j = count-i-1
                dequearr.append(str1[j])
                str1.remove(at: j)
            }
            return dequearr
        }
        
   
}

print("enter the string")
var name = String(readLine()!)
var q = queue()
q.enque(name)
var arr = q.deque()
var j  = 0
var  bool  = true
for i in name {
    if(String(i) != arr[j]){
        bool = false
    }
    j = j + 1
}
if(bool){
    print("palindrome")
}
else{
    print("not palindrome")
}

