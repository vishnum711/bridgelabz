//
//  volt.swift
//  adapterPattern
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class Volt{
    var volts: Int
    init(v: Int) {
        self.volts = v
    }
    
   public func getVolt() -> Int{
        return volts
    }
    func setVolt(volts: Int){
        self.volts = volts
    }
    
}
