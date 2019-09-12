//
//  socketObjectAdapter.swift
//  adapterPattern
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class socketObjAdapter: socketAdapter{
    var sock = socket()
    func get120volt() -> Volt {
        return sock.getVolt()
    }
    func get12volt() -> Volt {
       var  v = sock.getVolt()
        return convertVolt(v,10)
    }
    func get3volt() -> Volt {
      var  v = sock.getVolt()
        return convertVolt(v,40)
    }
    func convertVolt(_ v: Volt,_ val: Int) -> Volt{
        return Volt(v: v.getVolt()/val)
    }
}
