//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Eric Zhang on 8/10/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableView:UITableView!
    
    var Items = [TodoListItem]()
    
    
    
    func favoriteItem(index: Int) {
        Items[index].isFavoritie.toggle()
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func deleteItem(item: TodoListItem) {
        context.delete(item)
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    @objc func getAllItems() {
        do {
            Items = try context.fetch(TodoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
        self.tableView.refreshControl?.endRefreshing()
    }
    
    @objc func presentSettingsView() {
        let rootVC = SettingsViewController()
        
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    var addItemVC: AddItemViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddItemViewController))
        
        self.navigationItem.setRightBarButton(addButton, animated: true)

        
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        addItemVC = AddItemViewController()
        addItemVC?.delegate = self
        
        getAllItems()
        
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(getAllItems), for: .valueChanged)
    }
    
    
    @objc func presentAddItemViewController() {
        let addVC = AddItemViewController()
        let navVC = UINavigationController(rootViewController: addVC)
        
        self.present(navVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Items.count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.text = Items[indexPath.row].name

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) ->   UISwipeActionsConfiguration? {

      // Get current state from data source
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete",
         handler: { (action, view, completionHandler) in
        // Update data source when user taps action
            self.deleteItem(item: self.Items[indexPath.row])
            completionHandler(true)
        })

        deleteAction.image = UIImage(systemName: "trash")
        
        let bookmarkAction = UIContextualAction(style: .normal, title: "Bookmark",
         handler: { (action, view, completionHandler) in
        // Update data source when user taps action
            self.favoriteItem(index: indexPath.row)
            completionHandler(true)
        })

        bookmarkAction.image = UIImage(systemName: "star.fill")
        bookmarkAction.backgroundColor = .systemYellow
          

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, bookmarkAction])
        configuration.performsFirstActionWithFullSwipe = false 
        return configuration
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let itemInfoVC = ItemInfoViewController()
        itemInfoVC._title = Items[indexPath.row].name
        itemInfoVC._notes = Items[indexPath.row].notes
        itemInfoVC._createDate = Items[indexPath.row].createDate
        
        self.present(UINavigationController(rootViewController: itemInfoVC), animated: true, completion: nil)
    }
    
    func didFinish(_ sender: AddItemViewController) {
        print("H")
        getAllItems()
    }
    
}




