//
//  main.swift
//  prog1
//
//  Created by BridgeLabz on 20/08/19.
//  Copyright © 2019 Bridgelabz. All rights reserved.
//

import Foundation
print("Enter your name:")
var name = readLine()
var length = name!.count
if(length>=3){
    print("Hello \(name!) ,how are you?")
    
}
else{
    print("enter name with min 3 chars")
}

