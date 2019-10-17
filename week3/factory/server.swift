//
//  server.swift
//  factory
//
//  Created by admin on 9/11/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
struct server: ComputerClass {
    var Ram: String
    var Hdd: String
    
    init(Ram: String, Hdd: String) {
        self.Ram = Ram
        self.Hdd = Hdd
    }
    func RamHdd() -> String {
        return "The server with RAM \(Ram) and HDD \(Hdd)"
    }
}
