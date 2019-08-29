//
//  main.swift
//  Question2ds
//
//  Created by admin on 8/27/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class Node{
    var value: Int
    var next: Node?
    init(value: Int, next:Node?){
        self.value = value
        self.next = next
    }
}

class linkedlist {
    var head:Node?
    
    func insert(_ value: Int){
        if(head == nil){
            head = Node(value: value, next: nil)
            return
        }
        var current = head
        var previousnode: Node?
        while(current != nil && (current?.value)! < value){
            previousnode = current
            current = current?.next
        }
        previousnode?.next = Node(value: value, next: current)
    }
    func delete(_ value: Int){
        if(head?.value == value){
            head = head?.next
        }
        var current = head
        var previous: Node?
        while(current?.value != value && current != nil)
        {
            previous = current
            current = current?.next
        }
        previous?.next = current?.next
    }
    func display() ->[Int]{
        var current = head
        var arr = [Int]()
        while(current != nil){
            arr.append(current!.value)
            current = current?.next
        }
        print(arr)
        return arr
    }}
func input() ->Int{
    print("enter the no")
    var value = 2
    var no = readLine()
    value = Int(no!)!
    return value
}

let location = NSString(string: "/Users/admin/Desktop/array.txt").expandingTildeInPath
    let filecontent = try NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue)
    print(filecontent)
    var arr = filecontent.components(separatedBy: " ")
    var arr2 = [Int]()
for i in arr{
    arr2.append(Int(i)!)
}
arr2.sort()
print(arr2)
var ll = linkedlist()
for i in arr2{
    ll.insert(i)
}
 ll.display()
var value = input()
var bool = true
for i in arr2{
    if(value==i){
        bool = false
        break
    }
}
if(bool){
    ll.insert(value)
}
else{
    ll.delete(value)
}
var newarr =  ll.display()
print(newarr)
// code below is for converting arr to string and uploading to sublime
var s = newarr.map{ String($0) }.joined(separator: " ")
print(s)
let saveToPath = "/Users/admin/Desktop/array.txt"
do{
    try s.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
}
catch{
    
}
