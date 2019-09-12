//
//  main.swift
//  addressbook
//
//  Created by admin on 9/11/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation


print("Enter the number of enteries to be added:")
var Nos_entries = Int( readLine()! )!

var first_name: String
var last_name: String
var addr: String
var city: String
var state: String
var zip: Int
var ph_no: String

var edit = editBddressBook()
var itr = 0
while itr < Nos_entries{
    itr += 1
    print("Enter first name:")
    first_name = String( readLine()! )
    
    print("Enter last name:")
    last_name = String( readLine()! )
    
    print("Enter address name:")
    addr = String( readLine()! )
    
    print("Enter city:")
    city = String( readLine()! )
    
    print("Enter state:")
    state = String( readLine()! )
    
    print("Enter zip:")
    zip = Int( readLine()! )!
    
    print("Enter phone number:")
    ph_no = String( readLine()! )
    
    let address = Addressbook(first_name: first_name, last_name: last_name, addr: addr, city: city, state: state, zip: zip, ph_no: ph_no)
    edit.addAddress(value: address)
}
print("do you want to edit data in the adress book , enter Y if you want to")
var condition = String(readLine()!)
if condition=="y" || condition=="Y"{
    print("Enter first name of the person:")
    first_name = String( readLine()! )
    edit.editAddress(first_name: first_name)
}

print("do you want to delete data from the adress book , enter Y if you want to")
 condition = String(readLine()!)
if condition=="y" || condition=="Y"{
    print("Enter first name to delete from address book:")
    first_name = String( readLine()! )
    edit.deleteAddress(first_name: first_name)
}

print("DO you want to sort the data of addressbook")
condition = String(readLine()!)
if condition=="y" || condition=="Y"{
    print("press Y to sort by lastname and N to sort by zip")
    condition = String(readLine()!)
    if condition=="y" || condition=="Y"{
    edit.sortbylastname()
    }else{
        edit.sortbyzip()
    }
}

edit.printAddressBook()

