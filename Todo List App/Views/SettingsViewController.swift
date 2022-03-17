//
//  SettingsViewController.swift
//  SettingsViewController
//
//  Created by Eric Zhang on 8/10/21.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingsItems:[String] = ["General", "Notifications", "Rate This App", "Send Feedback"]
    let settingsIcons:[String] = ["list.bullet", "bell", "star.fill", "hand.thumbsup"]
    let settingsSubViews:[UIViewController] = [GeneralSettingsViewController(), NotificationsSettingsViewController(), RateSettingsViewController(), FeedbackSettingsViewController()]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemNames = settingsItems[indexPath.row]
        let itemIcons = settingsIcons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemNames
        cell.imageView?.image = UIImage(systemName: itemIcons)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let subVC = settingsSubViews[indexPath.row]
        
        navigationController?.pushViewController(subVC, animated: true)
        
    }
    
}

