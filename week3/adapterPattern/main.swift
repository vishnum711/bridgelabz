//
//  main.swift
//  adapterPattern
//
//  Created by admin on 9/12/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

func getVolt(Volts:socketAdapter,value:Int)->Volt
{
    switch(value)
    {
    case 3 :  return Volts.get3volt()
    case 12 : return Volts.get12volt()
    case 120 : return Volts.get120volt()
    default :  return Volts.get120volt()
    }
}

func testAdapter(){
   var SocketaAdapter = socketObjAdapter()
    var v3 = getVolt(Volts: SocketaAdapter, value: 3)
    var v12 = getVolt(Volts: SocketaAdapter, value: 12)
    var  v120 = getVolt(Volts: SocketaAdapter, value: 120)
    print("v3 volts using Object Adapter=", +v3.getVolt());
    print("v12 volts using Object Adapter=", +v12.getVolt());
    print("v120 volts using Object Adapter=", +v120.getVolt());
}
testAdapter()


