//
//  singleton class.swift
//  singleton Pattern
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class SingletonExampl {
    
    static let sharedInstance = SingletonExampl()
    
    var userInfo = (ID: "1", name: "vishnu")
    func network() {
        // get everything
    }
    
    private init() {
        print("Singleton class created")
    }
    
}
