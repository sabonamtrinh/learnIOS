//
//  AboutTableViewCell.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelAboutItem else {
                return
            }
            aboutLabel.text = item.about
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
