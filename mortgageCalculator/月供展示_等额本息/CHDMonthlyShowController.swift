//
//  CHDMonthlyShowController.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class CHDMonthlyShowController: UITableViewController {
    var hkze:Double!
    var yjhk:Double!
    var zflx:Double!
    var infoString:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
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
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("monthlyTableViewCell", owner: self, options: nil)?[0] as! monthlyTableViewCell

        cell.huanKuanZongELabel.text = useRoundedFloatStrWith(string: "\(hkze!)", precision: 6)
        cell.yueGongLabel.text = useRoundedFloatStrWith(string: "\(yjhk! * 10000)", precision: 2)
        cell.zhiFuliXiLabel.text = useRoundedFloatStrWith(string: "\(zflx!)", precision: 6)
        cell.infoLabel.text = self.infoString
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }


}
