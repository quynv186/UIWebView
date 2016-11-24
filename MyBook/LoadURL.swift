//
//  LoadURL.swift
//  MyBook
//
//  Created by QUYNV on 11/23/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    let baseUrl = "http://www."
    
    override func viewDidLoad() {
        myActivity.isHidden = true
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myActivity.isHidden = false
        
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(url: url as URL)
        self.webView.loadRequest(urlRequest as URLRequest)
        myActivity.startAnimating()
        
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivity.isHidden = true
        myActivity.stopAnimating()
    }
    
    @IBAction func action_Reload(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func action_next(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func action_back(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
}
