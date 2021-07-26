//
//  HeaderCollectionReusableView.swift
//  OT
//
//  Created by namtrinh on 22/07/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
