//
//  main.swift
//  oopsQ5
//
//  Created by admin on 9/9/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation


class Stockreport{
    var stock_symbol: String
    var nos_stock: Int
    var value: Double
    init(stock_symbol: String, nos_stock: Int, value: Double){
        self.stock_symbol = stock_symbol
        self.nos_stock = nos_stock
        self.value = value
    }
}
class transact{
    var amount:Double = 0
    var str = String()
    func buy(_ stockreport: Stockreport){
        str.append("Buying \(stockreport.stock_symbol) share value \(Double(stockreport.nos_stock)*stockreport.value)\n")
        amount += Double(stockreport.nos_stock)*stockreport.value
    }
    func sell(_ stockreport: Stockreport){
        str.append("Selling \(stockreport.stock_symbol) share value \(Double(stockreport.nos_stock)*stockreport.value)\n")
        amount -= Double(stockreport.nos_stock)*stockreport.value
    }
    func save(){
        let saveToPath = "/Users/admin/Desktop/stock.txt"
        do{
            try str.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
        }catch{
            print("pls check code")
        }
    }
    func printReport(){
        print(str)
        print("the total value of stock now is \(amount)")
    }
}
var transations = transact()
var stockrep = Stockreport(stock_symbol: "A", nos_stock: 5, value: 20)
transations.buy(stockrep)
stockrep = Stockreport(stock_symbol: "B", nos_stock: 6, value: 30)
transations.buy(stockrep)
stockrep = Stockreport(stock_symbol: "C", nos_stock: 7, value: 40)
transations.buy(stockrep)
stockrep = Stockreport(stock_symbol: "A", nos_stock: 2, value: 40)
transations.sell(stockrep)
transations.save()
transations.printReport()
