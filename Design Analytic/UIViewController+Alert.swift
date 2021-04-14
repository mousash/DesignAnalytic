//
//  UIViewController+Alert.swift
//  Design Analytic
//
//  Created by Mousa on 14.04.21.
//

import UIKit

protocol Alert: UIViewController {
    func setAlert(title: String, message: String)
}

extension Alert {
    func setAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
