//
//  LastViewModel.swift
//  Design Analytic
//
//  Created by Mousa on 14.04.21.
//

import Foundation

class LastViewModel {
    
    init() {
        UserDefaults.standard.setValue(PageStep.Last.rawValue, forKey: "PageStep")
    }
    
}
