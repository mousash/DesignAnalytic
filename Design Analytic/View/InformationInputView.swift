//
//  InformationInputView.swift
//  Design Analytic
//
//  Created by Mousa on 31.03.21.
//

import UIKit

class InformationInputView: UIView {
    
    let nibName = "InformationInputView"
    @IBOutlet var view : UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textFieldInput: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }
    
    func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InformationInputView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
        
    }
    
}
