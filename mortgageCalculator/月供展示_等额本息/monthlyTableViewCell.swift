//
//  monthlyTableViewCell.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit


class monthlyTableViewCell: UITableViewCell {
    @IBOutlet weak var yueGongLabel: UILabel!
    @IBOutlet weak var zhiFuliXiLabel: UILabel!
    @IBOutlet weak var huanKuanZongELabel: UILabel!

    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
