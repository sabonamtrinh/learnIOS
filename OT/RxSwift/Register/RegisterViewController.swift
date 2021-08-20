//
//  RegisterViewController.swift
//  OT
//
//  Created by namtrinh on 19/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private let bag = DisposeBag()
    private let image = BehaviorRelay<UIImage?>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
//        image.subscribe { img in
//            self.avatarImageView.image = img
//        }
//        .disposed(by: bag)
        
        image.asObservable().subscribe { img in
            self.avatarImageView.image = img
        }
        .disposed(by: bag)

    }
    
    private func configUI() {
        avatarImageView.layer.cornerRadius = 50.0
        avatarImageView.layer.borderWidth = 5.0
        avatarImageView.layer.borderColor = UIColor.gray.cgColor
        avatarImageView.layer.masksToBounds = true
        
        let rightBarButton = UIBarButtonItem(title: "Change Avatar", style: .plain, target: self, action: #selector(self.changeAvatar))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @IBAction func handleResgierButton(_ sender: UIButton) {
        RegisterModel.shared().register2(username: usernameTextField.text,
                                         password: passwordTextField.text,
                                         email: emailTextField.text,
                                         avatar: avatarImageView.image)
            .subscribe { done in
                print("Register successfully!")
            } onError: { error in
                print(error)
            }
            .disposed(by: bag)

    }
    
    @IBAction func handleClearButton(_ sender: Any) {
        
    }
    
    @objc func changeAvatar() {
        let vc = ChangeAvatarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.selectPhoto.subscribe { img in
            self.avatarImageView.image = img
        }  onDisposed: {
            print("Complete change Avatar!")
        }
        .disposed(by: bag)

    }
    
}
