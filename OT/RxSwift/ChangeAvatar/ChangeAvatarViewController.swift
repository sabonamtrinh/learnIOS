//
//  ChangeAvatarViewController.swift
//  OT
//
//  Created by namtrinh on 19/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ChangeAvatarViewController: UIViewController {

    @IBOutlet weak var imagesTableView: UITableView!
    
    private let bag = DisposeBag()
    private let selectedPhotoSubject = PublishSubject<UIImage>()
    
    var selectPhoto: Observable<UIImage> {
        return selectedPhotoSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesTableView.delegate = self
        imagesTableView.dataSource = self
        imagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        selectedPhotoSubject.onCompleted()
    }

}

extension ChangeAvatarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = imagesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "avatar \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let image = UIImage(named: "avatar_\(indexPath.row + 1)") {
            selectedPhotoSubject.onNext(image)
        }
    }
}
