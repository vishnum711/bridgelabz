//
//  ViewController.swift
//  userdata1
//
//  Created by admin on 9/17/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import UIKit

class ViewController:  UITableViewController{

    @IBOutlet weak var labelHeader: UILabel!
   
    
    var userList = [userData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // lets populate the table view
        let url = Bundle.main.url(forResource: "userlist", withExtension: "json")
        
        guard let jsonData = url
            else{
                print("data not found")
                return
        }
        guard let data = try? Data(contentsOf: jsonData)
            else{
                print("failed")
                return
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
            else{
                print("failed here")
                return
        }
        if let JSON = json as? [String:Any]{
            //labelHeader.text = JSON["title"] as? String
            
            guard let jsonArray = JSON["persons"] as? [[String: Any]] else{
                return
            }
            
            userList = jsonArray.compactMap{return userData($0)}
            self.tableView.reloadData()
             print(jsonArray)
        }
       
        
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentUser = userList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath as IndexPath) as! MyCustomTableViewCell
    cell.labelA.text = currentUser.userName
        cell.labelB.text = "\(currentUser.age)"
        cell.labelC.text = currentUser.address
        print(cell)
        return cell
    }

}

struct userData{
    var userName: String
    var age: Int
    var address: String
    init(_ dictionary:[String: Any]){
        self.userName = dictionary["name"] as? String ?? "NA"
        self.age = dictionary["age"] as? Int ?? 0
        self.address = dictionary["address"] as? String ?? "NA"
    }
}
class MyCustomTableViewCell: UITableViewCell{
    @IBOutlet var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    
}
