//
//  CheckListViewController.swift
//  MyReminders
//
//  Created by Evana Margain on 8/20/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var todoList = ToDoList()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
            label.text = todoList.checkListItems[indexPath.row].itemText
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
            if todoList.checkListItems[indexPath.row].isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            todoList.checkListItems[indexPath.row].isChecked = !todoList.checkListItems[indexPath.row].isChecked
        }
    }
}
