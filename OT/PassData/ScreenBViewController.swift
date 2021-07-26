//
//  ScreenBViewController.swift
//  OT
//
//  Created by namtrinh on 11/06/2021.
//

import UIKit

class ScreenBViewController: UIViewController {

    @IBOutlet weak var answerTextField: UITextField!
    //var delegate: ScreenBDelegate?
    var completion: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen B"
        // Do any additional setup after loading the view.
    }

    @IBAction func handelAButton(_ sender: Any) {
        
        //MARK: Delegate
        //self.delegate?.tappedA(data: self.answerTextField.text ?? "")
        
        //MARK: CallBack
//        if let text = self.answerTextField.text {
//            completion?("A:  \(text)")
//        }
        
        //MARK: Notification
        var info = [String:String]()
        info["data"] = "A: \(answerTextField.text ?? "")"
        NotificationCenter.default.post(name: NSNotification.Name("ABC"), object: nil, userInfo: info)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handelBButton(_ sender: Any) {
        
        //MARK: Delegate
        //self.delegate?.tappedB(data: self.answerTextField.text ?? "")
        
        //MARK: CallBack
//        if let text = self.answerTextField.text {
//            completion?("B: \(text)")
//        }
        
        //MARK: Notification
        var info = [String:String]()
        info["data"] = "B: \(answerTextField.text ?? "")"
        NotificationCenter.default.post(name: NSNotification.Name("ABC"), object: nil, userInfo: info)
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

protocol ScreenBDelegate {
    func tappedA(data: String)
    func tappedB(data: String)
}
