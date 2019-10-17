//
//  main.swift
//  prototypePattern
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
struct PrototypePattern {
    
    var name: String
    var value: Int = 100
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> PrototypePattern {
        return PrototypePattern(name: name)
    }
}


let prototype = PrototypePattern(name: "the original")

var bell1 = prototype.clone()
bell1.value = 12
bell1.name = "the copy"
var bell2 = prototype.clone()
bell2.value = 23

var bell3 = prototype.clone()
bell3.value = 0
print(prototype)
print(bell1)

