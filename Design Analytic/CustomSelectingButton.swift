//
//  CustomBorderButton.swift
//  arconsis
//
//  Created by Mousa on 18.02.21.
//

import UIKit

class CustomSelectingButton: UIButton {

    var isChecked: Bool = false {
        didSet {
            if isChecked == false {
                setIsChecked(titleColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), borderWidth: 1)
                
            }else {
                setIsChecked(titleColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), borderColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), borderWidth: 2)
            }
        }
    }
    
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
        isChecked = false
        titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        layer.cornerRadius = 10
    }
    
    private func setIsChecked(titleColor: UIColor, borderColor: UIColor, borderWidth: CGFloat) {
        setTitleColor(titleColor, for: .normal)
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
