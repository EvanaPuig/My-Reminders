//
//  CheckListViewController.swift
//  MyReminders
//
//  Created by Evana Margain on 8/20/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var checkListItems: [CheckListItem] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.createSampleData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = checkListItems[indexPath.row].itemText
        }
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(for: cell, at: indexPath)
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if checkListItems[indexPath.row].isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            checkListItems[indexPath.row].isChecked = !checkListItems[indexPath.row].isChecked
        }
    }
}

extension CheckListViewController {
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
