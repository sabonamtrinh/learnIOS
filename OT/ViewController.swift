//
//  ViewController.swift
//  OT
//
//  Created by namtrinh on 11/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var simpleTableButton: UIButton!
    @IBOutlet weak var mulCellTypesTableButton: UIButton!
    @IBOutlet weak var simpleCollectionButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Screen"
        
        //Observer notification
        NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotify(_:)), name: NSNotification.Name("ABC"), object: nil)
    }
    
    @objc func doWhenNotify(_ notifcation: Notification){
        
        if let dic = notifcation.userInfo as NSDictionary? {
            if let data = dic["data"] as? String {
                self.contentLabel.text = data
            }
        }
    }
    
    @IBAction func handelScreenBButton(_ sender: Any) {
        mulCellTypesTableButton.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.mulCellTypesTableButton.alpha = 1
        }
        
        let screen = TableMultipleCellTypesViewController()
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    @IBAction func handelLearnButton(_ sender: Any) {
        let learnScreen = LearnViewController()
        self.navigationController?.pushViewController(learnScreen, animated: true)
    }
    
    @IBAction func handleSimpleCollectionButton(_ sender: Any) {
        simpleCollectionButton.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.simpleCollectionButton.alpha = 1
        }
        
        let screen = SimpleCVViewController()
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    @IBAction func handleCoreDataButton(_ sender: UIButton) {
        let screen = DemoCoreDataViewController()
        self.navigationController?.pushViewController(screen, animated: true)
    }
}

