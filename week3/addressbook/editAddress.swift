//
//  editAddress.swift
//  addressbook
//
//  Created by admin on 9/11/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

class editBddressBook{
    var addreessBookData = [ Addressbook ]()
  
    func addAddress( value: Addressbook ) ->[Addressbook]{
          addreessBookData.append(Addressbook(first_name: "vishnu", last_name: "mishra", addr: "vashi", city: "mumbai", state: "maharastra", zip: 400703, ph_no: "00000"))
        addreessBookData.append(Addressbook(first_name: "sudipto", last_name: "bhatta", addr: "tone", city: "kolkata", state: "bengal", zip: 1246, ph_no: "9988788"))
        addreessBookData.append( value )
        return addreessBookData
    }
    
    func sortbylastname() {
        addreessBookData.sort{ ( $0.last_name, $0.first_name ) < ( $1.last_name, $1.first_name ) }
    }
    
    func sortbyzip() {
        addreessBookData.sort{ ( $0.zip ) < ( $1.zip ) }
    }
    
    func printAddressBook() {
        var count = 1
        for address in addreessBookData {
            print("Address No.: \(count)")
            print("Name: \(address.first_name)  \(address.last_name)")
            print("Address: "+address.address)
            print("City: "+address.city)
            print("State: "+address.state)
            print("Zip: "+String(address.zip))
            print("Phone Number: "+address.phone_number)
            count += 1
        }
    }
    
    func deleteAddress(first_name: String) {
        var itr = 0
        while addreessBookData[itr].first_name != first_name {
            itr += 1
        }
        addreessBookData.remove(at: itr)
    }

func editAddress(first_name: String) {
    var itr = 0
    var change = 0
    var newInfo: String
    
    while addreessBookData[itr].first_name != first_name {
        itr += 1
    }
    
    print("Enter 1 to change the last name, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the new last name:")
        newInfo = String( readLine()! )
        addreessBookData[itr].last_name = newInfo
    }
    
    print("Enter 1 to change the address, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the address to change:")
        newInfo = String( readLine()! )
        addreessBookData[itr].address = newInfo
        
    }
    
    print("Enter 1 to change the city, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the city to change:")
        newInfo = String( readLine()! )
        addreessBookData[itr].city = newInfo
    }
    
    print("Enter 1 to change the state, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the city to change:")
        newInfo = String( readLine()! )
        addreessBookData[itr].state = newInfo
    }
    
    print("Enter 1 to change the zip, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the zip to change:")
        newInfo = String( readLine()! )
        addreessBookData[itr].zip = Int(newInfo)!
    }
    
    print("Enter 1 to change the phone number, else 0:")
    change = Int( readLine()! )!
    if change == 1 {
        print("Enter the phone number to change:")
        newInfo = String( readLine()! )
        addreessBookData[itr].phone_number = newInfo
    }
    
}
}
