//
//  main.swift
//  state
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
let checkpermission = Context()
print(checkpermission.havePermission)
print(checkpermission.userName)
checkpermission.givePermission(UserName: "vishnu")
print(checkpermission.userName)
print(checkpermission.havePermission)
checkpermission.denyPermission()
print(checkpermission.havePermission)
print(checkpermission.userName)

