//
//  main.swift
//  Qone
//
//  Created by admin on 8/26/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Node{
    let value: String
    var next: Node?
    init(value: String, next: Node?){
        self.value = value
        self.next = next
    }
}


class linkedlist{
    var head: Node?
    
    func insert(value: String){
        if(head == nil){
            head = Node(value: value, next: nil)
            return
        }
        var current = head
        while(current?.next != nil){
            current = current?.next
        }
        current?.next = Node(value: value, next: nil)
    }
    
    func delete(value: String){
        if(head?.value==value){
            head = head?.next
        }
        var current = head
        var previous: Node?
        while(current?.value != value && current != nil){
            previous = current
            current = current?.next
        }
        previous?.next = current?.next
    }
    func display() ->[String]{
        var current = head
        var arr = [String]()
        while(current != nil){
            arr.append(current!.value)
            current = current?.next
        }
        return arr
    }
    
}



let location = NSString(string: "/Users/admin/Desktop/liverpool is loser").expandingTildeInPath
do{
    let filecontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
    print(filecontent)
    var arr = filecontent.components(separatedBy: " ")
    var list = linkedlist()
    for i in arr{
        list.insert(value: i)
    }
    //list.display()
    print("enter the name you want")
    var name = readLine()
    var value = String(name!)
    var bool = true
    for itr in arr{
        if (itr==value){
          bool = false
            break
        }
    }
    if(bool){
        list.insert(value: value)
    }
    else{
        list.delete(value: value)
    }
   var newarr =  list.display()
    let joined = newarr.joined(separator: " ")
    let saveToPath = "/Users/admin/Desktop/liverpool is loser"
    try joined.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
}
catch {
    print("not found")
}


