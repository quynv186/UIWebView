//
//  DetailBook.swift
//  MyBook
//
//  Created by QUYNV on 11/22/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class DetailBook: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var btn_getCurrentTime: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    
    var urlString : String!
    var type : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = urlString
        self.webView.delegate = self
        self.myActive.startAnimating()
        
        var urlpath = "default"
        
        switch (type) {
        case "PDF" : urlpath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
            self.btn_getCurrentTime.isHidden = true
        case "DOCX" : urlpath = Bundle.main.path(forResource: urlString, ofType: "docx")!
            self.btn_getCurrentTime.isHidden = true
        case "HTML" : urlpath = Bundle.main.path(forResource: urlString, ofType: "html")!
            self.btn_getCurrentTime.isHidden = false
        default : return
        }
        
        let url : NSURL = NSURL.fileURL(withPath: urlpath) as NSURL
        let urlRequest = NSURLRequest(url: url as URL)
        
        self.webView.loadRequest(urlRequest as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.myActive.isHidden = true
        self.myActive.stopAnimating()
    }
    
    @IBAction func action_getCurrentTime(_ sender: UIButton) {
        
        self.webView.stringByEvaluatingJavaScript(from: "hello();")
    }
    
}
