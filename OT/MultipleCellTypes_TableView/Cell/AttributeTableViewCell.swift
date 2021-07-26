//
//  AttributeTableViewCell.swift
//  OT
//
//  Created by namtrinh on 20/07/2021.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    var item: Attribute? {
        didSet {
            titleLabel.text = item?.key
            valueLabel.text = item?.value
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
