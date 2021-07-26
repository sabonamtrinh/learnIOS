//
//  EmailTableViewCell.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class EmailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelEmailItem else {
                return
            }
            emailLabel.text = item.email
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
