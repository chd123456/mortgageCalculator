//
//  downPaymentController.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class downPaymentController: UITableViewController {

    var money:Double!
    
    let array:[Double] = [0.0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0]
    
    var oneCell = Bundle.main.loadNibNamed("inputDownPaymentCell", owner: self, options: nil)?[0] as! inputDownPaymentCell
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
        return "房款总价为" + "\(money!)" + "万元"
        }else if section == 1
        {
        return "或者选择首付百分百"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0
        {
            return 1
        }else if section == 1
        {
        return 21
        }
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                return oneCell
            }
        }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
       let string = useRoundedFloatStrWith(string: "\(money * array[indexPath.row] / 10.0)", precision: 4)
        cell.textLabel?.text = "\(array[indexPath.row] * 10)" + "%" + " " + "(" + string + ")万元"
        
        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                return 60
            }
        }
        return 40
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1
        {
            self.oneCell.callBack(useRoundedFloatStrWith(string: "\(money * array[indexPath.row] / 10.0)", precision: 4))
            let _ = self.navigationController?.popViewController(animated: true)
        }

    }
    
}
