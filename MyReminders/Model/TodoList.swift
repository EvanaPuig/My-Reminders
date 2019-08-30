//
//  TodoList.swift
//  MyReminders
//
//  Created by Evana Margain on 8/30/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import Foundation

class ToDoList {
    
    var checkListItems: [CheckListItem] = []
    
    init() {
        createSampleData()
    }
    
    func createSampleData() {
        
        for i in 0...5 {
            if i == 0 {
                checkListItems.append(CheckListItem.init(itemText: "Run"))
            } else if i == 1 {
                checkListItems.append(CheckListItem.init(itemText: "Watch a movie"))
            } else if i == 2 {
                checkListItems.append(CheckListItem.init(itemText: "Code an app"))
            } else if i == 3 {
                checkListItems.append(CheckListItem.init(itemText: "Walk the dog"))
            } else if i == 4 {
                checkListItems.append(CheckListItem.init(itemText: "Study design patterns"))
            } else {
                checkListItems.append(CheckListItem.init(itemText: "Sleep"))
            }
        }
        
        print(checkListItems)
    }
    
}
