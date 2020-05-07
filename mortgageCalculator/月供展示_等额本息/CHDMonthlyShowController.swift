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
    var yjlx:Double!
    var array = [Double]()
    var howManyMonth:NSInteger = 0;
    
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
        if section == 0 {
            return 1;
        }
        return howManyMonth;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("monthlyTableViewCell", owner: self, options: nil)?[0] as! monthlyTableViewCell

            cell.huanKuanZongELabel.text = useRoundedFloatStrWith(string: "\(hkze!)", precision: 6)
            cell.yueGongLabel.text = useRoundedFloatStrWith(string: "\(yjhk! * 10000)", precision: 2)
            cell.zhiFuliXiLabel.text = useRoundedFloatStrWith(string: "\(zflx!)", precision: 6)
            cell.infoLabel.text = self.infoString
            return cell
        }else{
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            
            cell.textLabel?.text = "第\(indexPath.row + 1)期月供为：" + useRoundedFloatStrWith(string: "\(yjhk! * 10000)", precision: 2) + "元"
            
            //每月支付利息＝剩余本金 X 贷款月利率；
//            j1 a*i         b1 = b - j1
//            j2 = (a-b1)*i  b2 = b-j2
//            j3 = (a-b2)*i  b3 = b-j3
//            j4 = (a-b3)*i  b4 = b-j4
            
            let yglx = array[indexPath.row];
            let ygbj = yjhk * 10000 - yglx;
            cell.detailTextLabel?.text = "包含本金：" + useRoundedFloatStrWith(string: "\(ygbj)", precision: 2) + "元" +  "  与利息：" + useRoundedFloatStrWith(string: "\(yglx)", precision: 2) + "元"
            cell.detailTextLabel?.textColor = UIColor.lightGray;
            return cell
        }
        
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 105
        }
        return 44

    }


}
