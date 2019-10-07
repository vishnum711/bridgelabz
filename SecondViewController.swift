//
//  SecondViewController.swift
//  loginApp
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
 
 
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
   
    @IBOutlet weak var myNoteCollectionView: UICollectionView!
    
    var noteList:[noteFormat] = []
    var noteList2:[noteFormat] = []
    var loadIndex:[Int] = []
    var condition = 0
    @IBOutlet weak var ubeView: UIView!
    @IBOutlet weak var trail: NSLayoutConstraint!
    @IBOutlet weak var LogoutButton: UIButton!
    
    @IBOutlet weak var lead: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var getname = ""
    @IBAction func takeToLoginPageButton(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        takeToLoginPage()
    }
    //trying using func to pass data-----


    
    
    //------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutDesign()
        noteList = collectionArray()
        var ordrArry = retrieveOrderNotes()
        if ordrArry?.count != 0 {
        print("retrieved after load = \(ordrArry)")
        noteList2 = Array(repeating: noteFormat(title: "", noteDescription: "", noteIndex: 0), count: noteList.count)
        for i in 0 ..< noteList.count{
            noteList2[i] = noteList[ordrArry![i]]
        }
        }else{
            noteList2 = noteList
        }
        // Do any additional setup after loading the view.
        welcomeLabel.text = "welcome \(getname)"
        lead.constant = -414
        trail.constant = -414
        ubeView.layer.cornerRadius = 8
        
        //move cells-----
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        myNoteCollectionView.addGestureRecognizer(longPressGesture)
    }
    
    func collectionArray()->[noteFormat]{
        var tempArray:[noteFormat] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for i in 0 ..< result.count{
                let data: NSManagedObject = result[i] as! NSManagedObject
                let noteData = noteFormat(title: data.value(forKey: "title") as! String, noteDescription: data.value(forKey: "noteDescription") as! String, noteIndex: i)
            //print(data.value(forKey: "title") as! String)
           tempArray.append(noteData)
            }
        } catch{
            print("failed")
        }
        return tempArray
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! noteCollectionViewCell

        let item = noteList2[indexPath.item]
        cell.title.text = item.title
        cell.noteDscrptn.text = item.noteDescription
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    

    
    
    var hamburgerMenuVisible = false
    @IBAction func buttonForAnimation(_ sender: Any) {
        if !hamburgerMenuVisible{
            lead.constant = -414+150
            trail.constant = -414+150
           // LogoutButton.isHidden = true
            hamburgerMenuVisible = true
            self.view.sendSubviewToBack(LogoutButton)
        }else{
            lead.constant = -414
            trail.constant = -414
            hamburgerMenuVisible = false
            //LogoutButton.isHidden = false
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("complete")
        }
    }
    
 
    @IBAction func createNoteButton(_ sender: Any) {
       takeTocCreateNote()
    }
    
    func layoutDesign(){
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        myNoteCollectionView.collectionViewLayout = layout
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = noteList2.remove(at: sourceIndexPath.item)
        noteList2.insert(temp,at: destinationIndexPath.item)
        
    loadIndex = Array(repeating: 0, count: noteList2.count)
        print(loadIndex)
        for i in 0 ..< noteList.count{
            loadIndex[i] = noteList2[i].noteIndex
        }
     UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        defaults.set(loadIndex, forKey: "Index")
   
    
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var main  = UIStoryboard(name: "Main", bundle: nil)
        let third = main.instantiateViewController(withIdentifier: "editVC") as! editDelete
        third.noteTitle = noteList2[indexPath.item].title
        third.noteDescription = noteList2[indexPath.item].noteDescription
        third.noteIndex = noteList2[indexPath.item].noteIndex
        self.present(third,animated: true,completion: nil)
    }
    
    func retrieveOrderNotes()->[Int]?{
        //UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        return array
    }
    

}
