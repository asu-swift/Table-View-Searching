//
//  ViewController.swift
//  tableview
//
//  Created by Mykala Lemmons on 9/25/19.
//  Copyright © 2019 Mykala Lemmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var data = ["tools",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
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

}

