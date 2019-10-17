//
//  ViewController.swift
//  collectionViewPractice
//
//  Created by admin on 9/30/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var images:[Image] = []
   var Str  = "ABCDEFGHIJK"
    var chars:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        images = collectionArray()
        for i in Str{
            chars.append(String(i))
        }
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        myCollectionView.addGestureRecognizer(longPressGesture)
      
        // Do any additional set up after loading the view.
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
         layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        myCollectionView.collectionViewLayout = layout
        
        
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer){
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = myCollectionView.indexPathForItem(at: gesture.location(in: myCollectionView)) else{ break }
            myCollectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            myCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            myCollectionView.endInteractiveMovement()
        default:
            myCollectionView.cancelInteractiveMovement()
        }
    }
    
    
 func collectionArray()->[Image]{
    var tempArray: [Image] = []
    var image1 = Image( image: UIImage(named: "hamburger")!)
        var image2 = Image( image: UIImage(named: "image2")!)
        var image3 = Image( image: UIImage(named: "image3")!)
    var image4 = Image( image: UIImage(named: "image4")!)
    var image5 = Image( image: UIImage(named: "image5")!)
    //var image6 = Image( image: UIImage(named: "image6")!)
    tempArray.append(image1)
    tempArray.append(image2)
    tempArray.append(image3)
    tempArray.append(image4)
    tempArray.append(image5)
    //tempArray.append(image6)
    return tempArray
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return chars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       var item = chars[indexPath.item]
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.myLabelView.text = item
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = chars.remove(at: sourceIndexPath.item)
        chars.insert(temp,at: destinationIndexPath.item)
        print(chars)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

}
