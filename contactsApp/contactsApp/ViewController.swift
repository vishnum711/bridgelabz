//
//  ViewController.swift
//  contactsApp
//
//  Created by admin on 9/18/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import UIKit
class ViewController: UITableViewController {
  
    var cellId = "cellId"
    var userList = [userData]()
    var names = [String]()
    var twoDarray = [ExpandableNames]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UserList"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
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
            //  labelHeader.text = JSON["title"] as? String
            var title = JSON["title"] as? String
            print(title)
            guard let jsonArray = JSON["persons"] as? [[String: Any]] else{
                return
            }
            
            
            userList = jsonArray.compactMap{return userData($0)}
            //self.tableView.reloadData()
            print(jsonArray)
        }
        var numOfNames = userList.count
        print(userList.count)
        for itr in 0..<numOfNames{
            names.append(userList[itr].userName)
        }
        for itr in 0..<numOfNames{
            twoDarray.append(ExpandableNames(isExpanded: false, names: ["\(userList[itr].age)",userList[itr].address]))
        }
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
       // button.backgroundColor = .red
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
//        if section == 0 {
//             button.setTitle("0", for: .normal)
//        }
//        if section == 1{
//             button.setTitle("1", for: .normal)
//        }
     button.setTitle(names[section], for: .normal)
        return button

//        let label = UILabel()
//        label.text = "Header"
//        label.backgroundColor = UIColor.green
//        return label
    }
    @objc func handleExpandClose(button: UIButton){
         //try to close the section first by removing rows
        var indexPaths = [IndexPath]()
        let section = button.tag
        for row in twoDarray[section].names.indices{
            let indexpath = IndexPath(row: row, section: section)
            indexPaths.append(indexpath)
        }
        let isExpanded = twoDarray[section].isExpanded
        twoDarray[section].isExpanded = !isExpanded
     //   twoDarray[section].removeAll()
     
       // button.setTitle(isExpanded ? "open" : "close", for: .normal)
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)}
        else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDarray.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return names.count }
//        else{
//            return cNames.count
//        }
        if !twoDarray[section].isExpanded{
            return 0
        }
        return twoDarray[section].names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
       // let name = indexPath.section == 0 ?names[indexPath.row] : cNames[indexPath.row]
        let name = twoDarray[indexPath.section].names[indexPath.row]
        cell.textLabel?.text = name
       // cell.textLabel?.text = "\(name) section:\(indexPath.section) row:\(indexPath.row)"
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

