//
//  PC.swift
//  factory
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
struct pc: ComputerClass {
    var Ram: String
    var Hdd: String
    
    init(Ram: String, Hdd: String) {
        self.Ram = Ram
        self.Hdd = Hdd
    }
    func RamHdd() -> String {
        return "The PC with RAM \(Ram) and HDD \(Hdd)"
    }
}
