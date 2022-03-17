//
//  ItemInfoViewController.swift
//  ItemInfoViewController
//
//  Created by Eric Zhang on 8/17/21.
//

import UIKit

class ItemInfoViewController: UIViewController {
    
    
    var _title: String?
    var _notes: String?
    var _createDate: String?
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()
    
    private let createDateLabel: UILabel = {
        let createDateLabel = UILabel()
        createDateLabel.font = UIFont(name: "times", size: 15)
        return createDateLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = _title
        
        view.backgroundColor = .systemBackground
        
        createDateLabel.text = _createDate
        view.addSubview(createDateLabel)
        
        descriptionLabel.text = _notes
        view.addSubview(descriptionLabel)
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        createDateLabel.frame = CGRect(x: 16, y: self.view.safeAreaInsets.top, width: self.view.bounds.width, height: 15)
        descriptionLabel.frame = CGRect(x: 16, y: self.view.safeAreaInsets.top + 30, width: self.view.bounds.width, height: 20)
    }

}
