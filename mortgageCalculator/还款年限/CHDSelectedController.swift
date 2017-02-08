//
//  CHDSelectedController.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class CHDSelectedController: UITableViewController {

   var callBack:((String,Int)->Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row + 1)年 " + "(" + "\((indexPath.row + 1) * 12)" + "期)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.callBack( "\(indexPath.row + 1)年 " + "(" + "\((indexPath.row + 1) * 12)" + "期)",indexPath.row)
        let _ = self.navigationController?.popViewController(animated: true)

    }


}
