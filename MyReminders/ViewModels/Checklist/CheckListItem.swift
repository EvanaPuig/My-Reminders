//
//  CheckListItem.swift
//  MyReminders
//
//  Created by Evana Margain on 8/30/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    var itemText = ""
    var isChecked = false
    
    override init() {
        self.itemText = ""
    }
    
    init(itemText: String) {
        self.itemText = itemText
    }
    
    func toggleChecked() {
        isChecked = !isChecked
    }
}
