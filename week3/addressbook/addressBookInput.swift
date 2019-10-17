//
//  File.swift
//  addressbook
//
//  Created by admin on 9/11/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Addressbook {
    var first_name: String
    var last_name: String
    var address: String
    var city: String
    var state: String
    var zip: Int
    var phone_number: String
    
    init(first_name: String, last_name: String, addr: String, city: String, state: String, zip: Int, ph_no: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.address = addr
        self.city = city
        self.state = state
        self.zip = zip
        self.phone_number = ph_no
    }
}
