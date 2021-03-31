//
//  WelcomeCollectionViewCell.swift
//  Design Analytic
//
//  Created by Mousa on 30.03.21.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "WelcomeCollectionViewCell"
    
    var item: WelcomeModel? {
        didSet {
            configure(item: item)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configure(item: WelcomeModel?) {
        titleLabel.text = item?.title
        detailLabel.text = item?.detail
    }
}
