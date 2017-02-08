//
//  CHDMonthlyController.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/7.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class CHDMonthlyController: UITableViewController {
    var hkze:Double!
    var yjhk:Double!
    var zflx:Double!
    var infoString:String!
    var array:[Double]!
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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0
        {

        return 1
            
        }else
        {
            return array.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        if indexPath.section == 0 && indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("monthlyCell", owner: self, options: nil)?[0] as! monthlyCell
            
            cell.huanKuanZongELabel.text = useRoundedFloatStrWith(string: "\(hkze!)", precision: 6)

            cell.zhiFuliXiLabel.text = useRoundedFloatStrWith(string: "\(zflx!)", precision: 6)
            cell.infoLabel.text = self.infoString
            return cell
        }else
        {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "第\(indexPath.row + 1)期月供为：" + useRoundedFloatStrWith(string: "\(array[indexPath.row] * 10000)", precision: 2) + "元"
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0
        {
            return 155
        }else
        {
            return 40
        }
        
    }
    
    
}
