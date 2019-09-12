//
//  socketAdaptor.swift
//  adapterPattern
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
protocol socketAdapter {
    func get120volt() -> Volt
    func get12volt() -> Volt
    func get3volt() -> Volt
}
