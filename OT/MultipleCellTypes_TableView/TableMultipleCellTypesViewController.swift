//
//  TableMultipleCellTypesViewController.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class TableMultipleCellTypesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = viewModel
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
       
        tableView.register(NamePictureTableViewCell.nib, forCellReuseIdentifier: NamePictureTableViewCell.identifier)
        tableView.register(AboutTableViewCell.nib, forCellReuseIdentifier: AboutTableViewCell.identifier)
        tableView.register(EmailTableViewCell.nib, forCellReuseIdentifier: EmailTableViewCell.identifier)
        tableView.register(FriendTableViewCell.nib, forCellReuseIdentifier: FriendTableViewCell.identifier)
        tableView.register(AttributeTableViewCell.nib, forCellReuseIdentifier: AttributeTableViewCell.identifier)
    }


   
}
