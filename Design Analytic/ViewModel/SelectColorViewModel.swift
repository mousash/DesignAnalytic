//
//  SelectColorViewModel.swift
//  Design Analytic
//
//  Created by Mousa on 08.04.21.
//

import Foundation

class SelectColorViewModel {
    
    var isColoreItems = false
    
    var colorItems = [ColorModel(color: .systemRed, isSelected: false), ColorModel(color: .systemBlue, isSelected: false), ColorModel(color: .systemPink, isSelected: false), ColorModel(color: .systemYellow, isSelected: false), ColorModel(color: .systemGreen, isSelected: false), ColorModel(color: .systemPurple, isSelected: false), ColorModel(color: .systemGray, isSelected: false), ColorModel(color: .systemOrange, isSelected: false), ColorModel(color: .systemIndigo, isSelected: false), ColorModel(color: .systemTeal, isSelected: false)]
    
    var items = [ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false), ColorModel(color: .lightGray, isSelected: false)]
    
    init() {
        UserDefaults.standard.setValue(PageStep.SelectColor.rawValue, forKey: "PageStep")
    }
    
    func getItems() -> [ColorModel] {
        if isColoreItems {
            return colorItems
        }else {
            return items
        }
    }
    
    func toggleItem(index: Int) {
        if isColoreItems {
            colorItems[index].isSelected.toggle()
        }else {
            items[index].isSelected.toggle()
        }
    }

}
