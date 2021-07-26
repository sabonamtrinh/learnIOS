//
//  FriendTableViewCell.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var item: Friend? {
        didSet {
            guard let item = item else {
                return
            }
            if let pictureUrl = item.pictureUrl {
                pictureImageView?.image = UIImage(named: pictureUrl)
            }
            nameLabel?.text = item.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView?.layer.cornerRadius = 50
        pictureImageView?.clipsToBounds = true
        pictureImageView?.contentMode = .scaleAspectFit
        pictureImageView?.backgroundColor = UIColor.lightGray
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        pictureImageView.image = nil
    }
    
}
