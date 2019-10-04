//
//  ViewController.swift
//  fordeleting
//
//  Created by admin on 9/27/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //save()
     // edit()
       // delete()
       // fetch()
       textview.text = "I am not editable, butcbdjhcjchdbchbchjsdchscbscbhscbhsbchjscbs cbsdcbhj ccsbcc chcdbcc cdhcbc"
        }
    func save(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("vishnu", forKey: "username")
        newUser.setValue("123", forKey: "age")
        newUser.setValue("123456", forKey: "password")
        do {
            try context.save()
        }catch{
            print("failed saving")
        }
    }
    
    func fetch(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print("\(data.value(forKey: "username") as! String) \(data.value(forKey: "age") as! String)")
                // print()
                //                if "ravind" == data.value(forKey: "username") as! String {
                //                    print(data.value(forKey: "password") as! String)
                //                }
            }
        } catch{
            print("failed")
        }
    }
    
    func edit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "vishnu")
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("sudipta", forKey: "username")
            objectUpdate.setValue("1234", forKey: "age")
            objectUpdate.setValue("vffgf", forKey: "password")
            do {
                try context.save()
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
  
    }
    
    func delete(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "sudipta")
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectDelete = test[0] as! NSManagedObject
        context.delete(objectDelete)
            do {
                try context.save()
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        
    }


}

