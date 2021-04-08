//
//  SelectColorCollectionViewCell.swift
//  Design Analytic
//
//  Created by Mousa on 08.04.21.
//

import UIKit

class SelectColorCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "SelectColorCollectionViewCell"
    
    var item: ColorModel? {
        didSet{
            configure(item: item)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configure(item: ColorModel?) {
        guard let item = item else {return}
        
        backgroundColor = item.color
        
        if item.isSelected {
            layer.borderWidth = 10
            layer.borderColor = #colorLiteral(red: 0.457952261, green: 0.756100595, blue: 0.9222099185, alpha: 1)
        }else {
            layer.borderWidth = 0
            layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }

}
