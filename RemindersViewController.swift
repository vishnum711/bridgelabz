//
//  RemindersViewController.swift
//  loginApp
//
//  Created by admin on 10/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import Alamofire
class RemindersViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var remindersCollectionView: UICollectionView!
    var reminders:[reminderFormat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionArray2()
        
        let imageView:UIImageView = UIImageView(image: UIImage(named: "notes6img"))
        view.addSubview(imageView)
        imageView.imageBackground(self,"notes6img")

       reminders = collectionArray2()
        //sleep(1)
        print(reminders)
       // print(collectionArray2())
       // print("reminder \(reminders.count)")
        layoutDesign()
        // Do any additional setup after loading the view.
      let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongGesture(gesture:)))
        remindersCollectionView.addGestureRecognizer(longPressGesture)
    }
    override var canBecomeFirstResponder: Bool{
        return true
    }
    var index:IndexPath?
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            guard let selectedIndexPath = remindersCollectionView.indexPathForItem(at: gesture.location(in: remindersCollectionView)) else{ return }
            index = selectedIndexPath
            let menu = UIMenuController.shared
            becomeFirstResponder()
            let menuItemDelete = UIMenuItem(title: "Delete", action: #selector(handleMenuItemAction))
            menu.menuItems = [menuItemDelete]
            
            let location = gesture.location(in: gesture.view )
            let menuLocation = CGRect(x: location.x, y: location.y+100, width: 0, height: 0 )
            menu.setTargetRect(menuLocation, in: view)
            menu.setMenuVisible(true, animated: true)
        }
    }
    @objc func handleMenuItemAction(){
        print(index)
        delete(reminders[index!.item].uuid)
        reminders.remove(at: index!.item)
        remindersCollectionView.reloadData()
    }
    private func showSizeClasses(){
        layoutDesign()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSizeClasses()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { coordinator in
            self.showSizeClasses()
        }, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size:CGSize!
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {   size = CGSize(width: (UIScreen.main.bounds.height/3-6), height: (UIScreen.main.bounds.height/3 - 3))
            if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
                size = CGSize(width: size.width/1.5, height: size.height/1.5)
            }
            return size
        }
        else{
            size = CGSize(width: (UIScreen.main.bounds.width/3 - 3), height: (UIScreen.main.bounds.width/3 - 3))
            if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
                size = CGSize(width: (UIScreen.main.bounds.width/4 - 4), height: (UIScreen.main.bounds.width/4 - 4))
            }
            return size
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! reminderCollectionViewCell
        
        let item = reminders[indexPath.item]
       cell.remTextField.text = item.title + "\n" + item.date + "\n" + item.time
       cell.layer.borderWidth = 2
       cell.layer.cornerRadius = 5
       cell.layer.borderColor = UIColor.lightGray.cgColor
       return cell

    }

    func collectionArray()->[reminderFormat]{
        var tempArray:[reminderFormat] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminders")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for i in 0 ..< result.count{
                let data: NSManagedObject = result[i] as! NSManagedObject
               
                let remData = reminderFormat(uuid: data.value(forKey: "uuid") as! String, title: data.value(forKey: "remTitle") as! String, time: data.value(forKey: "timeRem") as! String, date: data.value(forKey: "dateRem") as! String)
                tempArray.append(remData)
            }
        } catch{
            print("failed")
        }
        return tempArray
    }
    
    @IBAction func backToHomePage(_ sender: Any) {
        var main  = UIStoryboard(name: "Main", bundle: nil)
        let home = main.instantiateViewController(withIdentifier: "homeVC") as! SecondViewController
        self.present(home,animated: true,completion: nil)

    }
    

    func delete(_ uuid: String){
         var defaults = UserDefaults.standard
        var array = defaults.array(forKey: "profile_Info")
        var id = array![0] as! String
        let reminderId = ["noteIdList":[uuid]]
        let url = "http://fundoonotes.incubation.bridgelabz.com/api/notes/removeReminderNotes?access_token="+id
        AF.request(url,method: .post,parameters: reminderId).responseJSON { response in
            debugPrint(response)
        }
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Reminders")
//        fetchRequest.predicate = NSPredicate(format: "uuid = %@", uuid)
//        do {
//            let test  = try context.fetch(fetchRequest)
//
//            let objectDelete = test[0] as! NSManagedObject
//            context.delete(objectDelete)
//            do {
//                try context.save()
//            } catch  {
//                print(error)
//            }
//        } catch  {
//            print(error)
//        }
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
            var identifiers: [String] = []
            for notification:UNNotificationRequest in notificationRequests {
                if notification.identifier == uuid {
                    identifiers.append(notification.identifier)
                }
            }
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
        }

    }
    
//    func layoutDesign(){
//        var itemSize = UIScreen.main.bounds.width/3-3
//        let orientation = UIApplication.shared.statusBarOrientation
//        if(orientation == .landscapeLeft || orientation == .landscapeRight){
//            itemSize = (UIScreen.main.bounds.height/3) }else{
//            itemSize = UIScreen.main.bounds.width/3-3
//        }
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 5,left: 0,bottom: 10,right: 0)
//        layout.itemSize = CGSize(width: itemSize, height: itemSize)
//        layout.minimumInteritemSpacing = 1
//        layout.minimumLineSpacing = 1
//        remindersCollectionView.collectionViewLayout = layout
//    }
    
    
    func layoutDesign(){
        var size:CGSize!
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {   size = CGSize(width: (UIScreen.main.bounds.height/3-6), height: (UIScreen.main.bounds.height/3 - 3))
            if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
                size = CGSize(width: size.width/1.5, height: size.height/1.5)
            }
        }
        else{
            size = CGSize(width: (UIScreen.main.bounds.width/3 - 3), height: (UIScreen.main.bounds.width/3 - 3))
            if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
                size = CGSize(width: (UIScreen.main.bounds.width/4 - 4), height: (UIScreen.main.bounds.width/4 - 4))
            }
        }
        // let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5,left: 0,bottom: 10,right: 0)
        //  layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.itemSize = size
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        remindersCollectionView.collectionViewLayout = layout
    }
    func collectionArray2()->[reminderFormat]{
        var reminders:[reminderFormat] = []
         var defaults = UserDefaults.standard
        var array = defaults.array(forKey: "profile_Info")
        var id = array![0] as! String
                //struct email doesn't contain email here, it contains voucher id of user
        let utilityQueue = DispatchQueue.global(qos: .utility)
        let url = "http://fundoonotes.incubation.bridgelabz.com/api/notes/getReminderNotesList?access_token="+id
        AF.request(url,method: .get).responseJSON(queue: utilityQueue) { response in
                                        //debugPrint(response)
                         let json = response.data
                        guard let Json = try? JSONSerialization.jsonObject(with: json!, options: [])
                        else{ print("failed here")
                            return}
                
                            if let JSON = Json as? [String:Any]{
                                if let success = JSON["data"] as? [String:Any]{
                                   // print(success)
                                    if let sccess = success["success"] as? Bool{
                                        print(sccess)
                                    }
                                    var data = success["data"] as! [[String:Any]]
                                    //print(data[0])
                                    var numNotes = data.count
                                    for i in 0 ..< numNotes{
                                    var jsonLast = data[i]
                                    if let JSON3 = jsonLast as? [String:Any]{
                                    let title = JSON3["title"] as? String
                                    let description = JSON3["description"] as? String
                                    let color = JSON3["color"] as! String
                                    let isArchived = JSON3["isArchived"] as! Bool
                                    let id = JSON3["id"] as! String
                                    let reminder = JSON3["reminder"] as! [String]
                                 print("\(title) \(description) \(color) \(isArchived) id is  \(id) \(reminder[0])")
                                        var str:String = reminder[0]
                    reminders.append(reminderFormat(uuid: id, title: title ?? " ", time: self.timeString(str), date: self.dateString(str)))
                                        }

                                    }
                              // print(reminders)
                                }

                                        }

                            }
               // print(noteList)
                       //   print(noteList)
        sleep(1)
       // print(reminders)
                      return reminders

    }
    func dateString(_ str:String)->String{
        var items = str.components(separatedBy: " ")
        var dateStr = items[1]+" "+items[2]+" "+items[3]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        var dt = dateFormatter.date(from: dateStr)
        let formatter2 = DateFormatter()
        formatter2.dateStyle = DateFormatter.Style.short
        var date = formatter2.string(from: dt!)
        return date
    }
    func timeString(_ str:String)->String{
        var items = str.components(separatedBy: " ")
        var dateStr = items[4]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        var dt = dateFormatter.date(from: dateStr)
        let formatter2 = DateFormatter()
        formatter2.timeStyle = DateFormatter.Style.short
        var time = formatter2.string(from: dt!)
        return time
    }
}
