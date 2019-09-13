//
//  permission.swift
//  state
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class permissionState: State{
    let UserName: String
    init(UserName: String) {
        self.UserName = UserName
    }
    func userName() -> String? {
        return UserName
    }
    func havePermission() -> Bool {
        return true
    }
}
