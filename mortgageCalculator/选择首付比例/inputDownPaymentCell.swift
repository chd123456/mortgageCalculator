//
//  inputDownPaymentCell.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class inputDownPaymentCell: UITableViewCell,UITextFieldDelegate {

    var callBack:((String?)->Void)!
    @IBOutlet weak var downPaymentTextField: UITextField!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let totalMoney = (self.viewController() as!downPaymentController).money
        let downPaymentMoney = (downPaymentTextField.text! as NSString).doubleValue
        if downPaymentMoney < 0
        {
            UIView().showMessage(message: "首付总额不能为负数", animateDuration: 2)
            return
        }else if downPaymentMoney > totalMoney!
        {
            UIView().showMessage(message: "首付总额不能超过房款总价", animateDuration: 2)
            return

        }
        self.callBack(downPaymentTextField.text)
        let _ = self.viewController()?.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK:拿到当前view所在的viewcontroller
    func viewController() ->UIViewController?{
        let vc:UIViewController?
        var next = self.superview
        while next != nil {
            
            let nextResponder = next?.next
            if nextResponder! is UIViewController
            {
                vc = nextResponder as?UIViewController
                return vc!
            }
            next = next!.superview
        }
        return nil;
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addNuberKey(textfiled: self.downPaymentTextField)
        self.downPaymentTextField.delegate = self
        self.selectionStyle = .none
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addNuberKey(textfiled:UITextField)
    {
        let keyboard = DigitalKeyboard(view: self.contentView)
        keyboard.style = .number
        keyboard.backgroundColor = UIColor(red: 3.0/255.0, green: 192.0/255.0, blue: 255.0/255.0, alpha: 1)
        keyboard.customDoneButton(title: "完成", titleColor: .white, theme: UIColor(red: 3.0/255.0, green: 192.0/255.0, blue: 255.0/255.0, alpha: 1) , target: nil, callback: nil)
        keyboard.isSafety = false
        textfiled.inputView = keyboard
    }

}
