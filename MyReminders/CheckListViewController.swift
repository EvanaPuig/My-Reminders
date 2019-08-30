//
//  CheckListViewController.swift
//  MyReminders
//
//  Created by Evana Margain on 8/20/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    var firstItem: CheckListItem!
    
    required init?(coder aDecoder: NSCoder) {
        firstItem = CheckListItem()
        firstItem.itemText = "Make food"
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            if indexPath.row == 0 {
                label.text = firstItem.itemText
            } else if indexPath.row % 5 == 1 {
                label.text = "Watch a movie"
            } else if indexPath.row % 5 == 2 {
                label.text = "Code an app"
            } else if indexPath.row % 5 == 3 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 4 {
                label.text = "Study design patterns"
            } else {
                label.text = "Sleep"
            }
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
            if indexPath.row == 0 {
                if firstItem.isChecked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
                firstItem.isChecked = !firstItem.isChecked
            } else {
                if cell.accessoryType == .none {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}

