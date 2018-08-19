//
//  ViewController.swift
//  WebApp
//
//  Created by Benny Davidovitz on 13/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    var latestWatchedYoutubeVideoId : String?{
        set{
            //Save id to disk
            guard let videoId = newValue else { return }
            UserDefaults.standard.set(videoId, forKey: "vid")
            UserDefaults.standard.synchronize()
        }
        get{
            //read id from disk
            return UserDefaults.standard.string(forKey: "vid")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        loadWelcomePage()
    }
    private func loadWelcomePage()
    {
        guard let fileURL = Bundle.main.url(forResource: "welcome", withExtension: "html") else{
            return
        }
        
        webView.loadRequest(URLRequest(url: fileURL))
    }
    
    @IBAction func yad2Action(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Yad 2 Pages", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Audi", style: .default, handler: { (_) in
            
            let urlString = "https://www.yad2.co.il/Cars/Car.php?ModelID=1&SubModelID=8"
            self.webView.loadRequest(URLRequest(url: URL(string: urlString)!))
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Golan", style: .destructive, handler: { (_) in
            let urlString = "https://www.yad2.co.il/Nadlan/sales.php?AreaID=83&fromPrice=400000&untilPrice=2000000&PriceType=1"
            self.webView.loadRequest(URLRequest(url: URL(string: urlString)!))
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    @IBAction func youtubeAction(_ sender: Any) {
        
        var urlString = "https://www.youtube.com"
        if let videoId = self.latestWatchedYoutubeVideoId{
            urlString += "/watch?v=" + videoId
        }
        guard let url = URL(string: urlString) else { return }
        
        webView.loadRequest(URLRequest(url: url))
    }
    
    @IBAction func googleAction(_ sender: Any) {
        
        let urlString = "https://www.google.com/search?q=recursion"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
    }
    

    //MARK: - UIWebView Delegate -
    func webViewDidStartLoad(_ webView: UIWebView) {
        titleLabel.text = " "
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if let pageTitle = webView.stringByEvaluatingJavaScript(from: "document.title"), !pageTitle.isEmpty{
            titleLabel.text = pageTitle
        } else {
            titleLabel.text = "No Title"
        }
        
        if let url = webView.request?.url,
            url.absoluteString.contains("youtube.com"),
            let query = url.query //text that follows question mark (?)
            {
                
                let pairsArray = query.components(separatedBy: "&")
                var dict : [String:String] = [:]
                
                for str in pairsArray{
                    let arr = str.components(separatedBy: "=")
                    let key = arr[0]
                    let value = arr[1]
                    dict[key] = value
                }
                
                if let videoId = dict["v"]{
                    self.latestWatchedYoutubeVideoId = videoId
                }
                
        }
        
        
    }

    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if let url = request.url,
            url.absoluteString.contains("wikipedia"){ //do not load wikipedia
            return false
        }
        
        return true
    }

}












