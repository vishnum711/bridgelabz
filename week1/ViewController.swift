//
//  ViewController.swift
//  keychain
//
//  Created by admin on 9/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
   var str = "ho are you? sudipta"
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        textView.text = str
       // textField.text = "\(str.count)"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     self.textView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object:  nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object:  nil)

    }

    @IBAction func button(_ sender: Any) {
//       str = textView.text
//        var str2 = textField.text
//        print(str)
//        print(str2)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.lightGray
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textField.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 500
    }
    
    @objc func updateTextView(notification: Notification){
        let userInfo = notification.userInfo!
        
        let keyboardEndFrameScreenCoordinates = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue ).cgRectValue
        let keyboardEndFrame = self.view.convert(keyboardEndFrameScreenCoordinates, to: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification{
            textView.contentInset = UIEdgeInsets.zero
        }else{
            textView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardEndFrame.height, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange )
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}

