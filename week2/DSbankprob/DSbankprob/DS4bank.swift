//
//  main.swift
//  DSbankprob
//
//  Created by admin on 8/28/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Queue{
    var sum = 0
    func enque(_ value: Int) ->Int{
        sum = sum + value
        return sum
    }
    func deque(_ value: Int) -> Int{
        sum = sum - value
        return sum
    }
    
}
print("no of persons in line")
var no = Int(readLine()!)
var queue = Queue()
for i in 1...no! {
    print("withdraw or deposit, press 1 for deposit and 0 for withdrawl")
    var check = Int(readLine()!)
    print("enter the amount")
    var amnt =  Int(readLine()!)
    if(check==0){
        queue.deque(amnt!)
    }
    else if(check==1){
        queue.enque(amnt!)
    }
}
print(queue.sum)
