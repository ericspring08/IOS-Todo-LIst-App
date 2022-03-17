//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Eric Zhang on 8/10/21.
//

import UIKit

class ViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view controllers
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        let favoritiesVC = UINavigationController(rootViewController: FavoritiesViewController())
        let viewControllers = [homeVC, favoritiesVC, settingsVC]
        
        //tab bar items
        let homeVCIcon = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        homeVC.tabBarItem = homeVCIcon
        let favoritiesVCIcon = UITabBarItem(title: "Favorities", image: UIImage(systemName: "star.fill"), tag: 1)
        favoritiesVC.tabBarItem = favoritiesVCIcon
        let settingsVCIcon = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 2)
        settingsVC.tabBarItem = settingsVCIcon  
        
        self.setViewControllers(viewControllers, animated: false)
        
        self.view.backgroundColor = .systemBackground
        
    }
    
}



