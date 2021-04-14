//
//  GoBackViewController.swift
//  Design Analytic
//
//  Created by Mousa on 12.04.21.
//

import UIKit

class GoBackViewController: UIViewController {

    weak var delegate: DataEnteredFromGoBackDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Go back"
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            // `self` is about to get popped.
            delegate?.userDidBack()
        }
    }

}
