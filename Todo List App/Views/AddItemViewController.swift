//
//  AddItemViewController.swift
//  AddItemViewController
//
//  Created by Eric Zhang on 8/16/21.
//

import UIKit


class AddItemViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate: AddItemDelegate?
    
    @objc func done() {
        createItem(name: titleField.text!, notes: descriptionField.text!)
        self.delegate?.didFinish(self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel() {
        self.dismiss(animated: true , completion: nil)
    }
    
    func createItem(name: String, notes: String) {
        let newItem = TodoListItem(context: context)
        newItem.name = name
        newItem.notes = notes
        newItem.createDate = String(Date().description.split(separator: Character(" "))[0])
        newItem.isFavoritie = false
        
        do {
            try context.save()
        }
        catch {
        
        }
    }
    
    private let titleField: UITextField = {
        let titleField = UITextField()
        titleField.placeholder = "Title (required)"
        titleField.layer.borderWidth = 1
        titleField.layer.borderColor = UIColor.lightGray.cgColor
        return titleField
    }()
    
    private let descriptionField: UITextField = {
        let descriptionField = UITextField()
        descriptionField.layer.borderWidth = 1
        descriptionField.layer.borderColor = UIColor.lightGray.cgColor
        descriptionField.placeholder = "Description (optional)"
        descriptionField.adjustsFontSizeToFitWidth = true
        return descriptionField
    }()
    
    var Done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Item"
        
        self.view.backgroundColor = .systemBackground
        //done and cancel button

        Done.isEnabled = false
        let Cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.rightBarButtonItem = Done
        self.navigationItem.leftBarButtonItem = Cancel
        
        view.addSubview(titleField)
        view.addSubview(descriptionField)
        
        titleField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)

    
        
        // Do any additional setup after loading the view.
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text! != "" {
            Done.isEnabled = true
        }else {
            Done.isEnabled = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        titleField.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: 30)
        descriptionField.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 30, width: view.bounds.width, height: 30)
    }
}
