//
//  appointment.swift
//  cliniqueproblem
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class appoint{
    func docappointment() ->[Patient]{
    var doctordata = docData()
    var docNames = [String]()
    for i in doctordata{
    docNames.append(i.name)
    }
        var patientData = [Patient]()
    print("doc name")
    var docname = String(readLine()!)
        for i in doctordata{
            if(i.name == docname){
                i.noOfApoointment = i.noOfApoointment+1
            } }
        if docNames.contains(docname){
            var index = 0
            while(docNames[index] != docname){
                index = index + 1
            }
            if doctordata[index].noOfApoointment < 5 {
            print("name")
            var name = String(readLine()!)
            print("mob no")
            var mob = String(readLine()!)
            print("age")
            var age = Int(readLine()!)
            var patientinfo = Patient(name: name.lowercased(), Mob: mob, age: age!)
            patientData.append(patientinfo)
            print("appointment made")
            }else{
                print("the doc has already five appintments")
            }
             }
        else{
            print("enter the correct doc name")
            }
        return patientData
        }
        
    }
    


