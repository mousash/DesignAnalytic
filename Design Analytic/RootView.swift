//
//  RootView.swift
//  Design Analytic
//
//  Created by Mousa on 27.04.21.
//

import UIKit

class RootView {
    
    func setupRootView() -> UIViewController {
        let pageStep = UserDefaults.standard.string(forKey: "PageStep")
        switch pageStep {
        case PageStep.UserInformation.rawValue :
            let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
            return UINavigationController(rootViewController: vc)
        case PageStep.SelectColor.rawValue :
            let vc = SelectColorsViewController(nibName: "SelectColorsViewController", bundle: nil)
            return UINavigationController(rootViewController: vc)
        case PageStep.AddItem.rawValue :
            let vc = AddItemViewController(isEditable: false, pageTitle: "Add an item", pageDescription: "try to add a new row to this animal list please")
            return UINavigationController(rootViewController: vc)
        case PageStep.Last.rawValue :
            let vc = LastViewController(nibName: "LastViewController", bundle: nil)
            return UINavigationController(rootViewController: vc)
        default:
            return WelcomeViewController(nibName: "WelcomeViewController", bundle: nil)
        }
    }
    
}
