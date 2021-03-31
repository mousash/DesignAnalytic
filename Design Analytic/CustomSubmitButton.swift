//
//  CustomBorderButton.swift
//  arconsis
//
//  Created by Mousa on 18.02.21.
//

import UIKit

class CustomSubmitButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonSetup()
    }

    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        buttonSetup()
    }
    
    func buttonSetup() {
        titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        layer.cornerRadius = 10
        setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
}
