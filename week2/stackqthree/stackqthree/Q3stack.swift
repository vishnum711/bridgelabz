//
//  main.swift
//  stackqthree
//
//  Created by admin on 8/26/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
struct stack<Element> {
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop(){
        items.removeLast()
    }
    func isempty(_ condition:Bool) ->Bool{
        if(items.count == 0 && condition) {
            return true
        }
        else{
            return false
        }
    }
    func top() ->Element{
        let cout = items.count
        return items[cout-1]
    }
}



print("Enter the exp")
//var str2: String = "hi "
var str = readLine()
var str2 = String(str!)
print(str2)
var stackofexp = stack<String>()
var condition = true
for i in str2{
    var ch = String(i)
    if(ch == "(" || ch == "[" || ch == "{"){
        stackofexp.push(ch)
         print(ch)
    }
    if(ch == ")" || ch == "]" || ch == "}"){
        var topval = stackofexp.top()
        switch ch{
        case ")":
            if(topval=="[" || topval=="{"){
                condition = false
            }
        case "]":
            if(topval=="(" || topval=="{"){
                condition = false
            }
        case "}":
            if(topval=="(" || topval=="["){
                condition = false
            }
        default:
            condition = true
        }
        stackofexp.pop()
         print(ch)
    }
    
}
if(stackofexp.isempty(condition)){
    print("balanced:"+str2)
}
else{
    print("unbalanced:"+str2)
}

