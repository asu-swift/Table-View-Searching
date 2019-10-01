//
//  ViewController.swift
//  tableview
//
//  Created by Mykala Lemmons on 9/25/19.
//  Copyright © 2019 Mykala Lemmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    let data = ["tools",]
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "toolTableView")
        let holderText = data[indexPath.row]
        myCell?.textLabel?.text = holderText
        return myCell!
    }
    func searchBar(_searchBar: UISearchBar, textDidChange searchText: String)
    {
        filteredData = searchText.isEmpty ? data : data.filter{(item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        myTableView.reloadData()
    }
}

