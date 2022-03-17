//
//  GeneralSettingsViewController.swift
//  GeneralSettingsViewController
//
//  Created by Eric Zhang on 8/10/21.
//

import UIKit

class GeneralSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        title = "General"
        
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
}
