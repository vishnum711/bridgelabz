//
//  permissionDenyState.swift
//  state
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class permissionDeniedState: State{
    func havePermission() -> Bool {
        return false
    }
    
    func userName() -> String? {
        return nil
    }
    
}
