//
//  searchDoc.swift
//  cliniqueproblem
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class searchDoc{
    func isSearchDoc(){
        var docdata = docData()
        var docnames = [String]()
        var docDepartment = [String]()
        var Availability = [String]()
        for i in docdata{
            docnames.append(i.name)
            docDepartment.append(i.department)
            Availability.append(i.availability)
        }
        
            print("for searching doctor : \n  a.) to search by name \n b.) to search by department c.) to search by availability")
            var input = String(readLine()!)
            if(input=="a" || input == "A"){
                print("enter the name")
                input = String(readLine()!)
                if docnames.contains(input.lowercased()){
                    var index = 0
                    while(docnames[index] != input){
                        index = index + 1
                    }
                    print("doc name = \(docdata[index].name) department =  \(docdata[index].department) availability = \(docdata[index].availability)")
                }
                else{
                    print("not found")
                }
            }else if(input=="b" || input == "B"){
                print("enter the department")
                input = String(readLine()!)
                if docDepartment.contains(input){
                    var index = 0
                    while(docDepartment[index] != input){
                        index = index + 1
                    }
                    print("doc name = \(docdata[index].name) department =  \(docdata[index].department) availability =  \(docdata[index].availability)")
                }
                else{
                    print("not found")
                }
            }else if(input=="c" || input == "C"){
                print("enter AM , PM, or BOTH")
                input = String(readLine()!)
                if Availability.contains(input.uppercased()){
                    var index = [Int]()
                    for i in 0 ..< Availability.count{
                        if (Availability[i] == input.uppercased()){
                            index.append(i)
                        }
                    }
                    for i in index {
                    print("doc name = \(docdata[i].name) department =  \(docdata[i].department) availability = \(docdata[i].availability)")
                    }
                   
                }
                else{
                    print("error in entering time")
                }
        
            }else{
                print("pls try again with valid input")
        }
}
}
