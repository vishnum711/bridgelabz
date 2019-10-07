//
//  editDelete.swift
//  loginApp
//
//  Created by admin on 10/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

class editDelete: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteDescrptn: UITextView!
    

    var noteTitle:String = "A"
    var noteDescription:String = "A"
    var noteIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
      var noteT = noteTitle
        print("-----------------------\(noteT)")
        print(noteDescription)
        print(noteDescription)
   titleField.text = noteT
    noteDescrptn.text = noteDescription
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
      edit()
        showMessage("Saved", "note edited", true)
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        delete()
        titleField.text = nil
        noteDescrptn.text = nil
        showMessage("Deleted", "note Deleted", true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        var main  = UIStoryboard(name: "Main", bundle: nil)
        let home = main.instantiateViewController(withIdentifier: "homeVC")
        self.present(home,animated: true,completion: nil)
    }
    
    
    
    func delete(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Notes")
        fetchRequest.predicate = NSPredicate(format: "title = %@", noteTitle)
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
        //delete index from user defaults------------
        var indexArr = retrieveOrderNotes()
        if indexArr?.count != 0 {
        var updatedIndexArr = indexArr!.filter {$0 != noteIndex}
        for i in 0 ..< updatedIndexArr.count{
            if updatedIndexArr[i] > noteIndex{
                updatedIndexArr[i] = updatedIndexArr[i]-1
            }
        }
        UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        defaults.set(updatedIndexArr, forKey: "Index")
        }
    }
    
    func edit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Notes")
        fetchRequest.predicate = NSPredicate(format: "title = %@", noteTitle)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(titleField.text, forKey: "title")
            objectUpdate.setValue(noteDescrptn.text, forKey: "noteDescription")
            do {
                try context.save()
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        
    }
    
    func retrieveOrderNotes()->[Int]?{
        //UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        return array
    }
    


}
