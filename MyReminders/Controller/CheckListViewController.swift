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
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.checkListItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList.checkListItems[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = todoList.checkListItems[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.itemText
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        item.toggleChecked()
    }
}
