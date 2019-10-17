//
//  createNewNote.swift
//  loginApp
//
//  Created by admin on 10/1/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
class createNewNote: UIViewController {

    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDescription: UITextView!
    
    @IBAction func btndlt(_ sender: Any) {
       //delete()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }
    

    
    func save(){
        var len = 0
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        do{
            let result = try context.fetch(request)
            len = result.count
        } catch{
            print("failed")
        }
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(noteTitle.text, forKey: "title")
        newUser.setValue(noteDescription.text, forKey: "noteDescription")
        newUser.setValue(len, forKey: "noteIndex")
//append array in user defaults for ordering
        let defaults = UserDefaults.standard
        var array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        var count = array.count
       array.append(count)
        UserDefaults.standard.removeObject(forKey: "Index")
        defaults.set(array, forKey: "Index")
        do {
            try context.save()
            showMessage("saved", "successful",true)
        }catch{
            print("failed saving")
        }
    }
    
    func fetch(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print("\(data.value(forKey: "title") as! String) \(data.value(forKey: "noteDescription") as! String) \(data.value(forKey: "noteIndex") as! Int)")
            }
        } catch{
            print("failed")
        }
    }
    
    @IBAction func saveNotesButton(_ sender: Any) {
        save()
        fetch()
    }
    
    
  
    
    
   
    
}
