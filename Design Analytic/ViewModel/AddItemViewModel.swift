//
//  AddItemViewModel.swift
//  Design Analytic
//
//  Created by Mousa on 01.04.21.
//

import Foundation

class AddItemViewModel {
    
    var items = ["Dog", "Cat", "Rabbit", "Parrot", "Goldfish", "Horse"]
    var seenItems = 3
    
    init() {
        UserDefaults.standard.setValue(PageStep.AddItem.rawValue, forKey: "PageStep")
    }
    
    func getItemsToBeSeen() -> Int {
        return seenItems
    }
    
    func addToSeenItems() {
        seenItems += 1
    }
    
    func getUserName() -> String {
        return UserDefaults.standard.string(forKey: "Name") ?? ""
    }
    
}
