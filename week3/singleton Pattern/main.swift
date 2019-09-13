//
//  main.swift
//  singleton Pattern
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print(SingletonExampl.sharedInstance.userInfo)
SingletonExampl.sharedInstance.userInfo.ID = "2"
SingletonExampl.sharedInstance.userInfo.name = "sudipto"
print(SingletonExampl.sharedInstance.userInfo)
