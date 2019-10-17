//
//  doctor.swift
//  cliniqueproblem
//
//  Created by admin on 9/9/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Doctor{
    var department: String
    var name: String
    var availability: String
    var noOfApoointment = 0
    init(department: String, name: String, availability: String) {
        self.department = department
        self.name = name
        self.availability = availability
    }
}

func docData() ->[Doctor]{
    var arrDoc = [Doctor]()
    var doctor = Doctor(department: "cardio", name: "docCardi", availability: "AM")
    arrDoc.append(doctor)
    doctor = Doctor(department: "nuro", name: "docNuro", availability: "PM")
    arrDoc.append(doctor)
    doctor = Doctor(department: "ortho", name: "docOrtho", availability: "BOTH")
    arrDoc.append(doctor)
    doctor = Doctor(department: "paediatrician", name: "docPaed", availability: "AM")
    arrDoc.append(doctor)
    return arrDoc
}
//var arr = docData()
//for i in arr{
//    print(i.availability)
//}

