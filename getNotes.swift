//
//  getNotes.swift
//  loginApp
//
//  Created by admin on 11/2/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

struct tokenID:Encodable {
    var id:String
}
class noteFetch{
    func isNoteFetch(){
        var noteList:[noteFormat] = []
        var defaults = UserDefaults.standard
        var array = defaults.array(forKey: "profile_Info")
        var id = array![0] as! String
        //struct email doesn't contain email here, it contains voucher id of user
        var voucher = tokenID(id: id as! String)
             AF.request("http://fundoonotes.incubation.bridgelabz.com/api/notes/getNotesList?access_token="+id,
                               method: .get
                               //parameters: voucher,
                               /*encoder: JSONParameterEncoder.default*/).responseJSON { response in
                                //debugPrint(response)
                            if  let json = (response.data){
                    guard let json = try? JSONSerialization.jsonObject(with: json, options: [])
                else{ print("failed here")
                    return}
        
                    if let JSON = json as? [String:Any]{
                        if let success = JSON["data"] as? [String:Any]{
                            print(success)
                            if let sccess = success["success"] as? Bool{
                                print(sccess)
                            }
                          var array = (success["data"]! as! NSArray).mutableCopy() as! NSMutableArray as! [Any]
                            print(array)
                            var noOfNotes:Int = (array.count ?? 0)
                    
                           //print(jsonLast)
                            for i in 0 ..< noOfNotes{
                                var jsonLast = array[i]
                            if let JSON3 = jsonLast as? [String:Any]{
                                let title = JSON3["title"] as? String
                                let description = JSON3["description"] as? String
                                let color = JSON3["color"]
                                let isArchived = JSON3["isArchived"] as! Bool
                                let id = JSON3["id"] as! String
                                let isPined = JSON3["isPined"] as! Bool
                                print("\(title) \(description) \(color) \(isArchived) \(id) \(isPined)")
//                                noteList.append(noteFormat(title: title ?? "", noteDescription: description ?? "", noteIndex: i,noteColor: <#T##UIColor#>, markImp: isPined, archived: isArchived, uuid: id))
                            }
                            }
                        }
                        
//                        if success == nil{
//                            var error = JSON["error"] as? [String:Any]
//                            var code = error!["code"] as? String
//                            print(code)
//                            self.showMessage("error", code!)
//
//                        }else{
//                            //self.showMessage("success", "reset in mail")
//                            self.showMessageAndChangePg("success", "reset in mail",true)
//                        }
//        //                                   guard let jsonArray = JSON["persons"] as? [[String: Any]] else{
//        //                                       return
//                                         }
                                }
                                }


                    }
                    
                    

                }

    
}
