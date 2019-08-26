//
//  main.swift
//  array
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

//print("Hello, World!")
var arr:[[String]] = Array(repeating: Array(repeating: " ", count: 3), count: 3)
print(arr)
arr[0][0]="a"
arr[1][1]="b"
arr[2][2]="c"
var bl = true

var bol = true
func random() ->(Int,Int){
    var rand1 = Int.random(in: 0...2)
    var rand2 = Int.random(in: 0...2)
    return(rand1,rand2)
}


while(bl){
    print("your turn")
    var x = readLine()
    var y = readLine()
    var i = Int(x!)
    var j = Int(y!)
    arr[i!][j!]="X"
    var k=0
    while(k<3&&bl==true){
        if((arr[k][0]==arr[k][1] && arr[k][1]==arr[k][2])||(arr[0][k]==arr[1][k] && arr[1][k]==arr[2][k])||(arr[0][0]==arr[1][1] && arr[1][1]==arr[2][2])||(arr[0][2]==arr[1][1] && arr[1][1]==arr[2][0])){
            bl = false
            print("user has won")
            break
        }
        k=k+1
    }
    var Bl = true
    while(Bl){
        var ran = random()
        if((arr[(ran.0)][(ran.1)] != "X") && arr[(ran.0)][(ran.1)] != "o"){
            arr[(ran.0)][(ran.1)]="o"
            Bl = false
        }
    }
    var l = 0
    while(l < 3 && bl == true){
        if((arr[l][0]==arr[l][1] && arr[l][1]==arr[l][2])||(arr[0][l]==arr[1][l] && arr[1][l]==arr[2][l])||(arr[0][0]==arr[1][1] && arr[1][1]==arr[2][2])||(arr[0][2]==arr[1][1] && arr[1][1]==arr[1][2])){
            bl = false
            print("computer has won")
            break
        }
        l=l+1
    }
    print(arr)
}

if(bl==true){print(arr)}

