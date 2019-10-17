//
//  main.swift
//  q3STOCK
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class stockportfolio{
    
    func isstockportfolio() ->([String],[Int],[Double]){
        var stockarr = [String]()
        var sharearr = [Int]()
        var valuearr = [Double]()
        
    //var nstocks = 0
    
    print("how many different stocks are there")
        let  nstocks = Int(readLine()!)
        for i in 0..<nstocks!{
            print("enter the name of stock")
            var sname = String(readLine()!)
            print("how many shares of this type")
            var shares = Int(readLine()!)
            print("value of each share")
            var val = Double(readLine()!)
            stockarr.append(sname)
            sharearr.append(shares!)
            valuearr.append(val!)
            
        }
        return (stockarr,sharearr,valuearr)
   
    }
}

class stock{
    func isstock(_ stockarr: [String], _ sharearr: [Int], _ valuearr: [Double]){
    
        var sum:Double = 0
        var stockprice = [Double]()
        for i in 0..<sharearr.count{
            stockprice.append(Double(sharearr[i])*valuearr[i])
            sum = sum + Double(sharearr[i])*valuearr[i]
        }
        print("     share_name   share_value")
        for i in 0..<sharearr.count{
            print("     \(stockarr[i])  \t\t  \(stockprice[i])")
        }
        print("total value of stocks  \(sum)")
    }
}

var stockPort = stockportfolio()
var tuple  = stockPort.isstockportfolio()
var stockarr = tuple.0
var sharearr = tuple.1
var valuearr = tuple.2
var Stock = stock()
Stock.isstock(stockarr,sharearr,valuearr)
