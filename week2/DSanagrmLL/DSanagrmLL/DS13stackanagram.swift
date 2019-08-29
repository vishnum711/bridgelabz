//
//  main.swift
//  DSanagrmLL
//
//  Created by admin on 8/28/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class Node{
    let value: Int
    var next: Node?
    init(value: Int, next: Node?){
        self.value = value
        self.next = next
    }
}

class StackLL{
    var head: Node?
    
    func insert(_ value: Int){
        if(head==nil){
            head = Node(value: value, next: nil)
            return
        }
        var previoushead = head
        head = Node(value: value, next: previoushead)
        
    }
    
//    func delete{
//    }
//
    func display() -> [Int]{
        var current = head
        var revarr = [Int]()
        while(current != nil){
            revarr.append(current!.value)
            current = current?.next
        }
        return revarr
    }
}




class Primenos{
    static func isPrimeno(_ num: Int) ->[Int]{
        var arr = [Int]()
        for i in 2..<num{
            var  k=2
            var flag=0
            while(k*k <= i){
                if(i%k == 0){
                    flag=1
                    break;
                }
                k = k+1
            }
            if(flag==0){
                arr.append(i)
            }
        }
        return arr
    }
}
var num = 1000
var arrobj = Primenos.isPrimeno(num)


func twD(_ arr: [Int]) ->[[Int]]{
    var length = arr.count
    var twDarr = Array(repeating: [Int](), count: 10)
    for i in arr {
        if(i<100){
            twDarr[0].append(i)
        }
        else if(i>100 && i<200){
            twDarr[1].append(i)
        }
        else if(i>200 && i<300){
            twDarr[2].append(i)
        }
        else if(i>300 && i<400){
            twDarr[3].append(i)
        }
        else if(i>400 && i<500){
            twDarr[4].append(i)
        }
        else if(i>500 && i<600){
            twDarr[5].append(i)
        }
        else if(i>600 && i<700){
            twDarr[6].append(i)
        }
        else if(i>700 && i<800){
            twDarr[7].append(i)
        }
        else if(i>800 && i<900){
            twDarr[8].append(i)
        }
        else if(i>900 && i<1000){
            twDarr[9].append(i)
        }
        
    }
    return twDarr
}



var twoD = twD(arrobj)
//for i in twoD{
//    print(i)
//}
var anaoneD = [Int]()
for i in twoD{
    for j in 0..<i.count{
        if(i[j]>11){
            var num = i[j]
            var hundrdth = num/100
            num = num%100
            var sum = 0
            while num != 0 {
                var temp = num%10
                num = num/10
                sum = 10*sum+temp
            }
            
            num = 100*hundrdth + sum
            for k in j+1..<i.count{
                if num == i[k] {
                    anaoneD.append(i[j])
                    anaoneD.append(i[k])
                }
            }
        }
    }
}
//print(anaoneD)
anaoneD.sort()
var stack = StackLL()
for i in anaoneD{
    stack.insert(Int(i))
}

print(stack.display())
