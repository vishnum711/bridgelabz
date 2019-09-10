//
//  main.swift
//  JSONq1oops
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

struct Inventory : Codable {
    var name : String?
    var weight : Int?
    var price : Int?
}


// /Users/bridgelabz/CustomFiles/myFile.json
let filePath = "/Users/admin/Desktop/test.json"  // file path
let fileData = FileManager.default.contents(atPath: filePath)

print(fileData!)

let decoder = JSONDecoder()
do {
    let jsonDictionary : [String: [Inventory]] = try decoder.decode(Dictionary.self, from: fileData!)
    
    
    let ArrayOfRiceInventory = jsonDictionary["rice"]
    var riceTotalVal = 0
    for singleInventory in ArrayOfRiceInventory! {
        riceTotalVal += (singleInventory.price! * singleInventory.weight!)    }
    print("total value of rice inventory is = Rs.\(riceTotalVal)")
    
    let ArrayOfWheatInventory = jsonDictionary["wheat"]
    var wheatTotalVal = 0
    for singleInventory in ArrayOfWheatInventory! {
        wheatTotalVal += (singleInventory.price! * singleInventory.weight!)    }
    print("total value of wheat inventory is = Rs.\(wheatTotalVal)")
    
    let ArrayOfPulsesInventory = jsonDictionary["pulses"]
    var pulsesTotalVal = 0
    for singleInventory in ArrayOfPulsesInventory! {
        pulsesTotalVal += (singleInventory.price! * singleInventory.weight!)    }
    print("total value of pulses inventory is = Rs.\(pulsesTotalVal)")
    
    
} catch let error {
    print(error.localizedDescription)
}


