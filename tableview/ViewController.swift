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
    let data = ["screwdriver","saw","hammer","panelsaw"]
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
    }
    func tableView(_ myTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ myTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func searchBar(_searchBar: UISearchBar, textDidChange searchText: String)
    {
        filteredData = searchText.isEmpty ? data : data.filter{(item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        myTableView.reloadData()
    }
}

