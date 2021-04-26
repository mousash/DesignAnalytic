//
//  AddTableViewCell.swift
//  Design Analytic
//
//  Created by Mousa on 26.04.21.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    static let reuseIdentifier = "AddTableViewCell"
    
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
