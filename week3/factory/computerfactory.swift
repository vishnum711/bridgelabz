//
//  computerfactory.swift
//  factory
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class ComputerFactory{
    func isComputerFactory(){
    print("what do you want ? enter PC or server or laptop")
    var input = String(readLine()!)
    print("enetr RAM and HDD")
    var ram = String(readLine()!)
    var hdd = String(readLine()!)
    //var Laptop: laptop?
    //var PC: pc?
    //var Server: server?
    switch input{
    case "laptop","Laptop","LAPTOP":
    print(laptop(Ram: ram, Hdd: hdd).RamHdd())
    case "server","Server","SERVER":
    print(server(Ram: ram, Hdd: hdd).RamHdd())
    case "pc","Pc","PC":
    print(pc(Ram: ram, Hdd: hdd).RamHdd())
    default:
    print("enter correct option")
    }
    }
    
}
