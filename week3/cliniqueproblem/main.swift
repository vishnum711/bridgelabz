//
//  main.swift
//  cliniqueproblem
//
//  Created by admin on 9/9/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation

print("1. check availability and search doctor \n 2.make appointment \n 3. search patient")
var input = Int(readLine()!)
while(input! == 1){
    var searchdoctor = searchDoc()
    searchdoctor.isSearchDoc()
    print("1.search again 4. exit")
    input = Int(readLine()!)
}
     var patientdata = [Patient]()
    print("enter 2.make appointment \n 3. search patient")
    input = Int(readLine()!)
while(input! == 2){
    var mainappoint = appoint()
   patientdata =  mainappoint.docappointment()
    print("2.make appointment 4. exit")
    input = Int(readLine()!)
}
    
    print("enter 3 to search patient")
    input = Int(readLine()!)
while(input! == 3){
    var searching = search()
    searching.isSearch()
    print("3.search again 4. exit")
    input = Int(readLine()!)
}

public class patientDat{
    func ispatientDat() ->[Patient]{
        return patientdata
    }
}
//class avail{
//    var
//    print("choose the department... 1. cardio 2. nuro 3. ortho 4. paediatrician")
//    var choice = Int(readLine()!)
//    switch choice{
//    case 1:
//    case 2:
//    case 3:
//    case 4:
//    default:
//    print("make the right choice")
//    }
//}
//var dat = docData()
//print(dat)
