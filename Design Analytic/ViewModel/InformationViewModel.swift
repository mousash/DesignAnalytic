//
//  InformationViewModel.swift
//  Design Analytic
//
//  Created by Mousa on 31.03.21.
//

import Foundation

class InformationViewModel {
    
    var name: String = ""
    var age: String = ""
    var gender: String = ""
    var location: String = ""
    
    init() {
        setDefaults()
    }
    
    private func setDefaults() {
        guard let name = UserDefaults.standard.string(forKey: "Name") else {return}
        self.name = name
        
        guard let age = UserDefaults.standard.string(forKey: "Age") else {return}
        self.age = age
        
        guard let gender = UserDefaults.standard.string(forKey: "Gender") else {return}
        self.gender = gender
        
        guard let location = UserDefaults.standard.string(forKey: "Location") else {return}
        self.location = location
    }
}
