//
//  state.swift
//  state
//
//  Created by admin on 9/13/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
protocol State{
    func havePermission() -> Bool
    func userName() ->String?
}
