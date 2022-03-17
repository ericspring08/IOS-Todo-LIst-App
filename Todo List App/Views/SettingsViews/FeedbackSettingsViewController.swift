//
//  FeedbackSettingsViewController.swift
//  FeedbackSettingsViewController
//
//  Created by Eric Zhang on 8/10/21.
//

import UIKit
import WebKit

class FeedbackSettingsViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formUrl = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeg0KS-MKy_4AzzqwsvETjzLGYVXatzViy6syhHgKVXtDGtAA/viewform?usp=sf_link")
        
        let myRequest = URLRequest(url: formUrl!)
        webView.load(myRequest)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
}
