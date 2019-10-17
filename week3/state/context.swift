//
//  context.swift
//  state
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Context{
    var state: State = permissionDeniedState()
    var havePermission: Bool {
        get{  return state.havePermission()
        }}
    
    var userName: String? {
        get {  return state.userName()}
        
    }
    
    func givePermission(UserName: String){
      state = permissionState(UserName: UserName)
    }
    func denyPermission(){
        state = permissionDeniedState()
    }
    
}
