//
//  searchPatient.swift
//  cliniqueproblem
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class search{
    func isSearch(){
var patientdata = patientDat()
        
var patientData = patientdata.ispatientDat()
        var patientnames = [String]()
        var patientMob = [String]()
        for i in patientData{
            patientnames.append(i.name)
            patientMob.append(i.Mob)
        }
        print(patientnames)
        if(patientnames != nil){
        print("for searching patient: \n  a.) to search by name \n b.) to search by mob no")
        var input = String(readLine()!)
        if(input=="a" || input == "A"){
            print("enter the name")
            input = String(readLine()!)
            if patientnames.contains(input.lowercased()){
                var index = 0
                while(patientnames[index] != input){
                    index = index + 1
                }
                print("name = \(patientData[index].name) mob =  \(patientData[index].Mob) age =  \(patientData[index].age)")
            }
            else{
                print("not found")
            }
        }else if(input=="b" || input == "B"){
            print("enter the mob")
            input = String(readLine()!)
            if patientMob.contains(input){
                var index = 0
                while(patientMob[index] != input){
                    index = index + 1
                }
                print("name = \(patientData[index].name) mob =  \(patientData[index].Mob) age =  \(patientData[index].age)")
            }
            else{
                print("not found")
            }
        }else{
            print("try again you entered wrong value")
        }
        }else{
            print("there is no patient data")
        }
        
    }
}
