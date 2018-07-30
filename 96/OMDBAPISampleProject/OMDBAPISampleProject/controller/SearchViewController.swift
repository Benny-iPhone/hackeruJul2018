//
//  SearchViewController.swift
//  OMDBAPISampleProject
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var tableView : UITableView!
    
    var page : Int = 1
    var tableArray : [OMDBObject] = []{
        didSet{
            tableView.bottomRefreshControl?.endRefreshing()
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.becomeFirstResponder()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        refreshControl.triggerVerticalOffset = 80
        tableView.bottomRefreshControl = refreshControl
    }
    
    @objc func loadNextPage()
    {
        page += 1
        getData()
    }

    func getData(){
        guard let term = searchBar.text, term.isEmpty == false else{
            tableArray = []
            return
        }
        
        APIManager.manager.search(term: term, page: self.page) { (arr, err) in
            
            if self.page == 1{
                self.tableArray = arr
            } else {
                self.tableArray += arr
            }
            
        }
    }

}

extension SearchViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OMDBObjectCell
        
        cell.configure(with: tableArray[indexPath.row])
        
        return cell
    }
}

extension SearchViewController : UISearchBarDelegate
{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() //close keyboard
        tableArray = []
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.page = 1
        getData()
    }
    
    
}

















