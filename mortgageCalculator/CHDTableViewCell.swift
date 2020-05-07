//
//  CHDTableViewCell.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/6.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

var infoDic = [String:Double]()
class CHDTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var shakeLabel2: UILabel!
    
    @IBAction func buttonClickForDEBX(_ sender: UIButton) {
        
        let vc = CHDSHow1ViewController(nibName: "CHDSHow1ViewController", bundle: Bundle.main)
        vc.title = "等额本息说明"
         (self.viewController() as!CHDViewController).navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonClickForDEBJ(_ sender: UIButton) {
        let vc = CHDShowViewController(nibName: "CHDShowViewController", bundle: Bundle.main)
        vc.title = "等额本金说明"
        (self.viewController() as!CHDViewController).navigationController?.pushViewController(vc, animated: true)
    }
    var method = 0
    
    @IBOutlet weak var housingMoneyTextField: UITextField!
    
    @IBOutlet weak var downPayment: UIButton!
    
    @IBOutlet weak var totalLending: UITextField!
    
    @IBOutlet weak var rateOfInterestButton: UIButton!
    
    @IBOutlet weak var repaymentButton: UIButton!
    
    var callBack:((Int)->Void)!
    
    @IBAction func downPaymentAction(_ sender: UIButton) {
        let downPaymentVC = downPaymentController(style: .grouped)
        if infoDic["housingMoney"] != nil
        {
        downPaymentVC.money = infoDic["housingMoney"]
        downPaymentVC.oneCell.callBack = { downPayment in
            
            let downPaymentMoney = Double((downPayment! as NSString).floatValue)
            let money = infoDic["housingMoney"]! - downPaymentMoney
     
            self.totalLending.text = useRoundedFloatStrWith(string: "\(money)", precision: 2)
             infoDic["totalLending"] = Double((self.totalLending.text! as NSString).floatValue)
            
            let percentage = useRoundedFloatStrWith(string: "\(downPaymentMoney / infoDic["housingMoney"]! * 100)", precision: 2) + "%" + "(" + useRoundedFloatStrWith(string: "\(downPaymentMoney)", precision: 2) + "万元)"
            
            
            self.downPayment.setTitle(percentage, for: .normal)
            print(downPayment!)
        }
        
        (self.viewController() as!CHDViewController).navigationController?.pushViewController(downPaymentVC, animated: true)
        }else
        {

            self.animationForMoneyCell(label: self.shakeLabel)
          
        }
        

    }
    
    
    
    
    func animationForMoneyCell(label:UILabel)
    {
        UIView.animate(withDuration: 0.35, animations: {
            UIView.animate(withDuration: 0.05, animations: {
                label.transform = CGAffineTransform(translationX: 5, y: 0)
                
            }, completion: { (completion) in
                
                UIView.animate(withDuration: 0.05, animations: {
                    label.transform = CGAffineTransform(translationX: -5, y: 0)
                    
                }, completion: { (completion) in
                    UIView.animate(withDuration: 0.05, animations: {
                        label.transform = CGAffineTransform(translationX: 10, y: 0)
                        
                    }, completion: { (completion) in
                        UIView.animate(withDuration: 0.05, animations: {
                            label.transform = CGAffineTransform(translationX: -10, y: 0)
                            
                        }, completion: { (completion) in
                            UIView.animate(withDuration: 0.05, animations: {
                                label.transform = CGAffineTransform(translationX: 5, y: 0)
                                
                            }, completion: { (completion) in
                                UIView.animate(withDuration: 0.05, animations: {
                                    label.transform = CGAffineTransform(translationX: -5, y: 0)
                                    
                                }, completion: { (completion) in
                                    UIView.animate(withDuration: 0.05, animations: {
                                        label.transform = CGAffineTransform(translationX: 0, y: 0)
                                        
                                    }, completion: { (completion) in
                                        if label.isEqual(self.shakeLabel)
                                        {
                                        self.housingMoneyTextField.becomeFirstResponder()
                                          UIView().showMessage(message: "选择首付比例之前,\n请先输入房款总价", animateDuration: 2)
                                        }else if label.isEqual(self.shakeLabel2){
                                            self.totalLending.becomeFirstResponder()
                                        UIView().showMessage(message: "亲爱的，请先输入贷款总额！", animateDuration: 2)
                                        }
                                    })
                                    
                                })
                                
                                
                            })
                            
                            
                        })
                        
                        
                    })
                    
                    
                })
            })
            
        }, completion: { (completion) in
            
            label.transform = CGAffineTransform(translationX: 0, y: 0)
            
        })
        
        //- (void)textFieldChanged:(id)sender
        //{
        //    NSLog(@"current ContentOffset is %@",NSStringFromCGPoint(_contentView.contentOffset));
        //}
        
        
    }

    
    
    @IBAction func rateOfInterestAction(_ sender: UIButton) {
        totalLending.resignFirstResponder();
        housingMoneyTextField.resignFirstResponder();
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
         let pickerView = CHDPickerView.creatPickerView()
         pickerView.callBack = { b in
             
             if infoDic["rate"] == nil
             {
              infoDic["rate"] = 0.049
             }
             if  infoDic["howManyMonth"] == nil
             {
                  infoDic["howManyMonth"] = 240
             }
             let row =  infoDic["howManyMonth"]!
             if self.method == 0
             {
                 if row <= 12
                 {
                     infoDic["rate"] = 0.0435

                 }else if row <= 60 && row > 0
                 {
                     infoDic["rate"] = 0.0475

                 }else{
                     infoDic["rate"] = 0.0490
                   
                 }
             }else if self.method == 1
             {
                 if row >= 0 && row <= 60
                 {
                     infoDic["rate"] = 0.0275
                     
                 }else                 {
                     infoDic["rate"] = 0.0325
                     
                 }
             }
             
             
             infoDic["rate"] = infoDic["rate"]! * b
             if b != 1.0
             {
             let bStr = useRoundedFloatStrWith(string: "\(b)", precision: 2)
             let rateStr = useRoundedFloatStrWith(string: "\(infoDic["rate"]!*100)", precision: 2)
             self.rateOfInterestButton.setTitle("基准利率 * \(bStr) = (\(rateStr)%)", for: .normal)
             } else
             {
                 self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
             }
         }
        
         UIApplication.shared.keyWindow?.addSubview(pickerView)
         UIView.animate(withDuration: 0.3, animations: {
             pickerView.frame = CGRect(x: 0, y: DeviceH - 150, width: DeviceW, height: 150)
         }) { (complete) in
             
         }
         

        }
    }
    @IBAction func repaymentAction(_ sender: UIButton) {
        
        let selectVC = CHDSelectedController(style: .grouped)
        selectVC.callBack = { string,row in
            
            self.repaymentButton.setTitle(string, for: .normal)
            infoDic["howManyMonth"] = Double((row + 1)*12)
            if self.method == 0
            {
                if row == 0
                {
                    infoDic["rate"] = 0.0435
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else if row <= 4 && row > 0
                {
                    infoDic["rate"] = 0.0475
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else{
//                    if infoDic["rate"] != nil {
//
//                    }
//                    infoDic["rate"] = 0.0490
                 
                    self.rateOfInterestButton.setTitle("利率 (\((useRoundedFloatStrWith(string: "\(infoDic["rate"]!*100)", precision: 2)))%)", for: .normal)
                }
            }else if self.method == 1
            {
                if row >= 0 && row <= 4
                {
                    infoDic["rate"] = 0.0275
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else                 {
                    infoDic["rate"] = 0.0325
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }
            }

        }
        
        (self.viewController() as!CHDViewController).navigationController?.pushViewController(selectVC, animated: true)
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

    @IBAction func constantPaymentMortgage(_ sender: UIButton) {

       // infoDic["totalLending"] 贷款总额
       // infoDic["rate"] 年利率
       // infoDic["howManyMonth"] 还款月数
        totalLending.resignFirstResponder();
        housingMoneyTextField.resignFirstResponder();
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            if infoDic["totalLending"] == nil
            {
                self.animationForMoneyCell(label: self.shakeLabel2!)
                return
            }
            if infoDic["rate"] == nil
            {
                infoDic["rate"] = 0.049
            }
            if infoDic["howManyMonth"] == nil
            {
                infoDic["howManyMonth"] = 240
            }
            
            
            //设贷款额为a，月利率为i，年利率为I，还款月数为n，每月还款额为b，还款利息总和为Y
            //I = 12*i
            //月均还款:b＝a×i×（1＋i）^n÷〔（1＋i）^n－1〕
            //支付利息:Y＝n×a×i×（1＋i）^n÷〔（1＋i）^n－1〕－a
            //还款总额:S=n×a×i×（1＋i）^n÷〔（1＋i）^n－1〕
            //每月支付利息＝剩余本金 X 贷款月利率；

            
            //1 = a * i 每月利息
            //2 = b - (a*i)
                
            //每月归还本金＝每月还本付息额-每月支付利息。
            
            let i = infoDic["rate"]! / 12.0
            let a = infoDic["totalLending"]!
            let n = infoDic["howManyMonth"]!
            
            let b = a*i*pow(1+i, n)/(pow(1+i, n) - 1)
            let y = n*a*i*pow(1+i, n)/(pow(1+i, n) - 1) - a
            let s = n*a*i*pow(1+i, n)/(pow(1+i, n) - 1)
            let vc = CHDMonthlyShowController(style: .grouped)
       
       
            var arrar = [Double]()
            
//            for index in 1...Int(n){
//                arrar.append(self.getMonthLX(index, a: a * 10000, i: i, b: b * 10000))
//            }
            
            vc.title = "等额本息"
            vc.howManyMonth = NSInteger(n);
            vc.yjhk = b
            vc.zflx = y
            vc.hkze = s
            vc.array = arrar;
            vc.infoString = "贷款总额：\(useRoundedFloatStrWith(string: "\(infoDic["totalLending"]!)", precision: 2))万元" + "\n" + "贷款利率：\(infoDic["rate"]!*100)%" + "\n" + "还款月数：\(Int(infoDic["howManyMonth"]!))个月"
            
            (self.viewController() as!CHDViewController).navigationController?.pushViewController(vc, animated: true)

        }
    }
    // n 月份 a 贷款总额 i 月利率 b每月还款总额
//    func getMonthLX(_ n: Int, a:Double ,i:Double,b:Double)->Double{
////        let jn = (a - Double( n - 1 ) * b + j1 + ... + j(n-1) ) * i
//        //等额本息还款
//        //n月份
//        //a贷款总额
//        //i月利率
//        //b每月还款总额
////       // jn为每月还款利息
////        let j1 = (a - Double(0) * b) * i
////        let j2 = (a - Double(1) * b + j1) * i
////        let j3 = (a - Double(2) * b + j1 + j2) * i
////        let j4 = (a - Double(3) * b + j1 + j2 + j3) * i
////        let j5 = (a - Double(4) * b + j1 + j2 + j3 + j4) * i
////        let j6 = (a - Double(5) * b + j1 + j2 + j3 + j4 + j5) * i
////        let j7 = (a - Double(6) * b + j1 + j2 + j3 + j4 + j5 + j6) * i
////        let j8 = (a - Double(7) * b + j1 + j2 + j3 + j4 + j5 + j6 + j7) * i
////        let j9 = (a - Double(8) * b + j1 + j2 + j3 + j4 + j5 + j6 + j7 + j8) * i
////        return 0;
//////
////         jn = (a - Double( n - 1 ) * b + j1 + ... + j(n-1) ) * i
//        
//    }
            
    @IBAction func averageCapitalMethod(_ sender: UIButton) {
        totalLending.resignFirstResponder();
        housingMoneyTextField.resignFirstResponder();
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
         if infoDic["totalLending"] == nil
         {
             self.animationForMoneyCell(label: self.shakeLabel2)
             return
         }
         if infoDic["rate"] == nil
         {
             infoDic["rate"] = 0.049
         }
         if infoDic["howManyMonth"] == nil
         {
             infoDic["howManyMonth"] = 240
         }

         let i = infoDic["rate"]! / 12.0  // 月利率
         let a = infoDic["totalLending"]! // 贷款总额
         let n = infoDic["howManyMonth"]! // 总期数
         let b = a / infoDic["howManyMonth"]! // 月供本金
         // 月供本金=贷款总额/总期数
         // 总利息={贷款总额×n－月供本金×[n×(n-1)/2] }×贷款月利率
         // 月还款=贷款总额/贷款总期数+[贷款总额－贷款总额/贷款总期数×(n-1)]×贷款月利率

         let zlx = (a*n - b*(n*(n-1)/2)) * i // 总利息
         let hkze = zlx + a                  // 还款总额
         var array = [Double]()
         let temp = Int(infoDic["howManyMonth"]!)

         for month in 1...temp
         {
             let temp = Double(month)
             let yhk = b + (a - a/n*(temp-1))*i
             array.append(yhk)
         }

         
         let vc = CHDMonthlyController(style: .grouped)
         vc.title = "等额本金"
         vc.hkze = hkze
         vc.zflx = zlx
         vc.dkze = infoDic["totalLending"]!
         vc.infoString = "贷款总额：\(useRoundedFloatStrWith(string: "\(infoDic["totalLending"]!)", precision: 2))万元" + "\n" + "利率：\(  (useRoundedFloatStrWith(string: "\(infoDic["rate"]!*100)", precision: 2)))%" + "\n" + "还款月数：\(Int(infoDic["howManyMonth"]!))个月"
         vc.array = array
         (self.viewController() as!CHDViewController).navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.addNuberKey(textfiled: self.housingMoneyTextField)
        self.addNuberKey(textfiled: self.totalLending)
        self.housingMoneyTextField.delegate = self
        self.totalLending.delegate = self
        infoDic["howManyMonth"] = 240
        self.callBack = { method in
            self.method = method
            if method == 0
            {// 商业贷款
                if infoDic["howManyMonth"]! <= 12.0
                {
                    infoDic["rate"] = 0.0435
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else if infoDic["howManyMonth"]! <= 60.0 && infoDic["howManyMonth"]! > 0
                {
                    infoDic["rate"] = 0.0475
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else{
                    infoDic["rate"] = 0.0490
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }

            }else if method == 1
            {// 公积金贷款
                if infoDic["howManyMonth"]! <= 12.0
                {
                    infoDic["rate"] = 0.0275
                    self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }else
                {
                infoDic["rate"] = 0.0325
                self.rateOfInterestButton.setTitle("基准利率 (\(infoDic["rate"]!*100)%)", for: .normal)
                }
            }else if method == 2
            {// 组合贷款
            
            }
            
            
        }
        
        // Initialization code
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text! == ""
        {
            return
        }
        if textField.isEqual(self.housingMoneyTextField)
        {
            textField.text = useRoundedFloatStrWith(string: self.housingMoneyTextField.text!, precision: 2)
            infoDic["housingMoney"] = Double((self.housingMoneyTextField.text! as NSString).floatValue)
            if infoDic["downPayment"] != nil
            {
                let downPayment = useRoundedFloatStrWith(string: "\((infoDic["housingMoney"])! * (infoDic["downPayment"])!)", precision: 2)
                let titleString = "\(useRoundedFloatStrWith(string:"\(infoDic["downPayment"]! * 100)", precision: 2))% " + "(" + "\(downPayment)" + "万元" + ")"
                self.downPayment.setTitle(titleString, for: .normal)

                self.totalLending.text = useRoundedFloatStrWith(string: "\((infoDic["housingMoney"])! - Double((downPayment as NSString).floatValue))", precision: 2)
                 infoDic["totalLending"] = Double((self.totalLending.text! as NSString).floatValue)
            }else
            {
               infoDic["downPayment"] = 0.3
                let downPayment = useRoundedFloatStrWith(string: "\((infoDic["housingMoney"])! * (infoDic["downPayment"])!)", precision: 2)
                let titleString = "30% " + "(" + "\(downPayment)" + "万元" + ")"
               self.downPayment.setTitle(titleString, for: .normal)
                
                self.totalLending.text = useRoundedFloatStrWith(string: "\((infoDic["housingMoney"])! - Double((downPayment as NSString).floatValue))", precision: 2)
                infoDic["totalLending"] = Double((self.totalLending.text! as NSString).floatValue)
            }

            
        }else if textField.isEqual(self.totalLending)
        {
            
            self.totalLending.text = useRoundedFloatStrWith(string: self.totalLending.text!, precision: 2)
            infoDic["totalLending"] = Double((self.totalLending.text! as NSString).floatValue)
            
            if infoDic["housingMoney"] != nil
            {
                let downPayment = infoDic["housingMoney"]! - infoDic["totalLending"]!
                infoDic["downPayment"] = downPayment / infoDic["housingMoney"]!
                let a = useRoundedFloatStrWith(string: "\((infoDic["downPayment"]!)*100)", precision: 2) + "%" + "(" + useRoundedFloatStrWith(string: "\(downPayment)", precision: 2) + "万元)"
                self.downPayment.setTitle(a, for: .normal)
                
            }
            
        
        }
        
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

func useRoundedFloatStrWith(string:String,precision:Int) ->String
{
    let formatter = NumberFormatter()
    let value = (string as NSString).doubleValue
    var format = NSMutableString(string: "#####0")
    if(precision == 0)
    {
        formatter.positiveFormat = format as String
        return formatter.string(from: NSNumber(value: value))!
        
    }
    else
    {
        format = NSMutableString(string: "#####0.")
        for _ in 1...precision
        {
            format.appendFormat("0")
        }
        formatter.positiveFormat = format as String
        return formatter.string(from: NSNumber(value: value))!
    }
}

