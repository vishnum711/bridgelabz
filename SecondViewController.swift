//
//  SecondViewController.swift
//  loginApp
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate{

    
 
    var conditionChanged:Bool = true
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
   
    @IBOutlet weak var topMenuView: UIView!
    @IBOutlet weak var topMnuViewCnclBtn: UIButton!
    
    @IBOutlet weak var myNoteCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var noteList:[noteFormat] = []
    var noteList2:[noteFormat] = []
    var tempNoteList:[noteFormat] = []
    var tempNoteList2:[noteFormat] = []
    var searchCondition:Bool = false
    var archivedNotes:[noteFormat] = []
    var loadIndex:[Int] = []
    var slidingViewLead = -UIScreen.main.bounds.width
    var slidingViewTrail = -UIScreen.main.bounds.width
    var slidingWidth:Int = 0
    var hamburgerMenuVisible = false
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
    func someMethodTotest(cell:UICollectionViewCell){
        print("inside second view controller")
        let num = myNoteCollectionView.indexPath(for: cell)
        var index = num!.item
       // print(num!.item)
        var item = noteList2[index]
        //print(item.title)
        item.markImp = !item.markImp
        markImpCoreData(item.title, item.markImp)
        myNoteCollectionView.reloadItems(at: [num!])
        
    }
//    func indexPath(for cell: UICollectionViewCell) -> IndexPath?{
//        return indexPath(for: cell)
//    }
    
    
    //------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topMenuView.isHidden = true
        layoutDesign()
        lead.constant = -UIScreen.main.bounds.width
        trail.constant = -UIScreen.main.bounds.width
      //UserDefaults.standard.removeObject(forKey: "Index")
        noteList = collectionArray()
        print(noteList.count)
   
        archivedNotes = noteList.filter({$0.archived != false })
        noteList = noteList.filter({$0.archived != true })
        
        for i in 0 ..< (noteList.count){
            noteList[i].noteIndex = i
        }
        print("hey \(noteList.count)")
        var ordrArry = retrieveOrderNotes()
        if ordrArry?.count != 0 {
        print("retrieved after load = \(ordrArry)")
            noteList2 = Array(repeating: noteFormat(title: "", noteDescription: "", noteIndex: 0, noteColor: UIColor.white, markImp: false, archived: false, uuid: "" ), count: noteList.count)
        for i in 0 ..< noteList.count{
            noteList2[i] = noteList[ordrArry![i]]
        }
        }else{
            noteList2 = noteList
            loadIndex = Array(repeating: 0, count: noteList2.count)
            for i in 0 ..< noteList2.count{
                loadIndex[i] = noteList2[i].noteIndex
            }
            let defaults = UserDefaults.standard
            defaults.set(loadIndex, forKey: "Index")
        }
        for i in noteList2{
            tempNoteList.append(i)
            tempNoteList2.append(i)
        }
        // Do any additional setup after loading the view.
        welcomeLabel.text = "welcome \(getname)"
        
        ubeView.layer.cornerRadius = 8
        
        //move cells-----
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        myNoteCollectionView.addGestureRecognizer(longPressGesture)
        
        //-----determine type of device
    
        
    }
    
    private func showSizeClasses(){
        slidingViewLead = -UIScreen.main.bounds.width
        slidingViewTrail = -UIScreen.main.bounds.width
        var horizontal = traitCollection.horizontalSizeClass.description
        var vertical = traitCollection.verticalSizeClass.description
        if horizontal == "Compact" && vertical == "Regular"{
            slidingWidth = 150
            if hamburgerMenuVisible{
                slideOn()
            }
        }else if horizontal == "Regular" && vertical == "Compact"{
            slidingWidth = 200
            let orientation = UIApplication.shared.statusBarOrientation
            if orientation == .landscapeRight{
                slidingWidth = 230
            }
            if hamburgerMenuVisible{
                slideOn()
            }
        }else if horizontal == "Regular" && vertical == "Regular"{
            slidingWidth = 180
            if hamburgerMenuVisible{
                slideOn()
            }
        }
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
        print("hi vishnu")
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
                size = CGSize(width: size.width/1.5, height: size.height/1.5)
            }
            return size
        }
    }
    //search functions -----------------
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCondition = true
       // tempNoteList.removeAll()
        if searchText.count != 0 {
            tempNoteList = noteList.filter({ index -> Bool in
                (index.title + index.noteDescription).lowercased().contains(searchText.lowercased())
            })
            noteList2 = tempNoteList
        } else {
            for itr in noteList2 {
                tempNoteList.append(itr)
            }
            noteList2 = tempNoteList
        }
        myNoteCollectionView.reloadData()
    }
  
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        noteList2 = tempNoteList2
        myNoteCollectionView.reloadData()
        searchCondition = false
    }
 
//  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//    super.touchesBegan(touches as! Set<UITouch>, with: event)
//        self.searchBar.endEditing(true)
//    }
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//        searchBar.resignFirstResponder()
//        return true
//    }
    
    //search functions -----------------
    //----multiple selection functions----------------------------------------------
    enum Mode{
        case view
        case select
    }
    var mMode:Mode = .view {
        didSet{
            switch mMode {
            case .view:
                for (key, value) in selectedIndexPaths{
                    if value{
                        myNoteCollectionView.deselectItem(at: key, animated: true)
                    }
                }
                selectedIndexPaths.removeAll()
                myNoteCollectionView.allowsMultipleSelection = false
            case .select:
                myNoteCollectionView.allowsMultipleSelection = true
            }
        }
    }
    
    var selectedIndexPaths:[IndexPath:Bool] = [:]
    @IBAction func topMenuArchiveBtn(_ sender: Any) {
        var indexes:[IndexPath] = []
        for (key,value) in selectedIndexPaths{
            if value{
                indexes.append(key)
            } }
        for i in indexes.sorted(by: { $0.item > $1.item }){
            updateUserDef(i.item)
            print(noteList2[i.item].title)
            markArchiveCoreData(noteList2[i.item].uuid)
            noteList2.remove(at: i.item)
        }
        for i in 0 ..< noteList2.count{
            noteList2[i].noteIndex = i
        }
        myNoteCollectionView.deleteItems(at: indexes)
        selectedIndexPaths.removeAll()
        topMenuView.isHidden = true
        mMode = .view
        selectedIndexPaths.removeAll()
 //        noteList2.remove(at: 2)
//        myNoteCollectionView.reloadData()
    }
    
    @IBAction func goToArchivedPg(_ sender: Any) {
        var main  = UIStoryboard(name: "Main", bundle: nil)
        let archive = main.instantiateViewController(withIdentifier: "archivedVC") as! ArchiveViewController
        archive.notesArchived = archivedNotes
        self.present(archive,animated: true,completion: nil)
    }
    
    @IBAction func topMenuCancel(_ sender: Any) {
        topMenuView.isHidden = true
         mMode = mMode == .view ? .select : .view
        
    }
    
    
    
    //----multiple selection functions----------------------------------------------
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
               // view.backgroundColor = UIColor.color(withData: data.value(forKey: "noteColor") as! Data)
                let noteData = noteFormat(title: data.value(forKey: "title") as! String, noteDescription: data.value(forKey: "noteDescription") as! String, noteIndex: i, noteColor: UIColor.color(withData: data.value(forKey: "noteColor") as! Data), markImp: data.value(forKey: "markImp") as! Bool, archived: data.value(forKey: "archived") as! Bool, uuid: data.value(forKey: "noteID") as! String)
            //print(data.value(forKey: "title") as! String)
           tempArray.append(noteData)
            }
        } catch{
            print("failed")
        }
        return tempArray
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList2.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! noteCollectionViewCell

        let item = noteList2[indexPath.item]
       // cell.title.text = item.title
        cell.noteDscrptn.text = item.title + "\n \n" + item.noteDescription
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
       // if conditionChanged{
            cell.layer.borderColor = UIColor.lightGray.cgColor
       // }
        //else{
           // cell.layer.borderColor = UIColor.black.cgColor
        //}
        cell.backgroundColor = item.noteColor
        cell.link = self
    
        let origiimage = UIImage(named: "star_filled")
        let tintedimage = origiimage?.withRenderingMode(.alwaysTemplate)
        cell.markButton.setImage(tintedimage, for: .normal)
        if !item.markImp{
            cell.markButton.tintColor = .lightGray}
        else{
            cell.markButton.tintColor = .red
        }
        return cell
    }
    
    

    
    
    
    @IBAction func buttonForAnimation(_ sender: Any) {
       slidingControl()
    }
    func slidingControl(){
        if !hamburgerMenuVisible{
            slideOn()
        }else{
            slideOff()
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("complete")
        }
    }
    func slideOn(){
        lead.constant = slidingViewLead + CGFloat(slidingWidth)
        trail.constant = slidingViewTrail + CGFloat(slidingWidth)
        hamburgerMenuVisible = true
        self.view.sendSubviewToBack(LogoutButton)
    }
    func slideOff(){
        lead.constant = slidingViewLead
        trail.constant = slidingViewTrail
        hamburgerMenuVisible = false
    }
    @IBAction func createNoteButton(_ sender: Any) {
       takeTocCreateNote()
    }
    
    func layoutDesign(){
       // let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5,left: 0,bottom: 10,right: 0)
      //  layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        myNoteCollectionView.collectionViewLayout = layout
        print("layout design SV \(UIScreen.main.bounds.width)")
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
        if !searchCondition{
        let temp = noteList2.remove(at: sourceIndexPath.item)
        noteList2.insert(temp,at: destinationIndexPath.item)
        
    loadIndex = Array(repeating: 0, count: noteList2.count)
        print(loadIndex)
        for i in 0 ..< noteList2.count{
            loadIndex[i] = noteList2[i].noteIndex
            print(noteList2.count)
            print(noteList2[i].noteIndex)
        }
     UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        defaults.set(loadIndex, forKey: "Index")
        }
    
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
            var main  = UIStoryboard(name: "Main", bundle: nil)
            let third = main.instantiateViewController(withIdentifier: "editVC") as! editDelete
            third.noteTitle = noteList2[indexPath.item].title
            third.noteDescription = noteList2[indexPath.item].noteDescription
            third.noteIndex = noteList2[indexPath.item].noteIndex
            third.color = noteList2[indexPath.item].noteColor
            third.uuid = noteList2[indexPath.item].uuid
            self.present(third,animated: true,completion: nil)
        case .select:
            selectedIndexPaths[indexPath] = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedIndexPaths[indexPath] = false
        //selectedIndexPaths = selectedIndexPaths.filter{ $0 != indexPath}
        }
    
    
    func retrieveOrderNotes()->[Int]?{
        //UserDefaults.standard.removeObject(forKey: "Index")
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "Index") as? [Int] ?? [Int]()
        return array
    }
//    func retrieveNotesColor(_ title: String)->UIColor{
//        //UserDefaults.standard.removeObject(forKey: "Index")
//        let defaults = UserDefaults.standard
//        let color = defaults.color(forKey: title)
//        return color!
//    }
    func markImpCoreData(_ title:String, _ bool: Bool){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Notes")
        fetchRequest.predicate = NSPredicate(format: "title = %@", title)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(bool, forKey: "markImp")
            do {
                try context.save()
            } catch  {
                print(error)
            }
        } catch  {
            print(error)
        }
        
    }
    
    @IBAction func goToReminders(_ sender: Any) {
        var main  = UIStoryboard(name: "Main", bundle: nil)
        let setReminderPg = main.instantiateViewController(withIdentifier: "remindersVC") as! RemindersViewController
        self.present(setReminderPg,animated: true,completion: nil)
    }
    
    
//update userdefaults after archive------
    func updateUserDef(_ index:Int){
        print("user def fnctn \(index)")
    var indexArr = retrieveOrderNotes()
    if indexArr?.count != 0 {
    var updatedIndexArr = indexArr!.filter {$0 != index}
        print("user def fnctn \(updatedIndexArr)")
    for i in 0 ..< updatedIndexArr.count{
    if updatedIndexArr[i] > index{
    updatedIndexArr[i] = updatedIndexArr[i]-1
    }
    }
                print("user def fnctn \(updatedIndexArr)")
    UserDefaults.standard.removeObject(forKey: "Index")
    let defaults = UserDefaults.standard
    defaults.set(updatedIndexArr, forKey: "Index")
    }
    }
    
//mark archive core data
    func markArchiveCoreData(_ uuid:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Notes")
        fetchRequest.predicate = NSPredicate(format: "noteID = %@", uuid)
        do {
            let test  = try context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(true, forKey: "archived")
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


extension UIUserInterfaceSizeClass:CustomStringConvertible{
    public var description: String{
        switch self {
        case .compact: return "Compact"
        case .regular: return "Regular"
        case .unspecified: return "??"
      
        }
    }
}
extension UICollectionView {
    func indexPathForView(view: AnyObject) -> IndexPath? {
        let originInCollectioView = self.convert(CGPoint.zero, from: (view as! UIView))
        return self.indexPathForItem(at: originInCollectioView) as IndexPath?
    }
    
}
