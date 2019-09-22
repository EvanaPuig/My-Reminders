//
//  AddItemTableViewController.swift
//  MyReminders
//
//  Created by Evana Margain on 8/30/19.
//  Copyright © 2019 Evana Margain. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: CheckListItem)
}

class AddItemTableViewController: UITableViewController {
    
    weak var delegate: AddItemViewControllerDelegate?
    weak var todoList: ToDoList?
    weak var itemToEdit: CheckListItem?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.itemText
            addBarButton.isEnabled = true
        }
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let item = CheckListItem()
        if let textfieldText = textField.text {
            item.itemText = textfieldText
        }
        item.isChecked = false
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
}

extension AddItemTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        
        return true
    }
}
