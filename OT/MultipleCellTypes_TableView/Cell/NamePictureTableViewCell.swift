//
//  NamePictureTableViewCell.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class NamePictureTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNamePictureItem else {
                return
            }
            nameLabel.text = item.name
            pictureImageView.image = UIImage(named: item.pictureUrl)
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
