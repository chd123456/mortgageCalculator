//
//  CHDPickerView.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/8.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class CHDPickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate {

    var callBack:((Double)->Void)!
    var titleArray = ["基准利率","7折利率","8折利率","8.3折利率","8.5折利率","8.8折利率","9折利率","9.5折利率","1.05倍利率","1.1倍利率","1.2倍利率","1.3倍利率"];
    var currentTitle = ""
    var button = UIButton(type: UIButtonType.custom)
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    class func creatPickerView()->CHDPickerView
    {
        let pickerView = Bundle.main.loadNibNamed("CHDPickerView", owner: self, options: nil)?[0] as!CHDPickerView
        pickerView.frame = CGRect(x: 0, y: DeviceH, width: DeviceW, height: 150)
        pickerView.button.frame = UIScreen.main.bounds
        UIApplication.shared.keyWindow?.addSubview(pickerView.button)
        pickerView.pickerView.dataSource = pickerView
        pickerView.pickerView.delegate = pickerView
        return pickerView
        
    }
    
    override func awakeFromNib() {
        self.button.addTarget(self, action: #selector(self.click(sender:)), for: .touchUpInside)
    }
    
    func click(sender:UIButton)
    {
        if self.superview != nil
        {
        sender.removeFromSuperview()
        }
        self.removeFromSuperview()
    }
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.click(sender: self.button)
    }
    
    @IBAction func confirmClick(_ sender: UIButton) {
        print(self.currentTitle)
        self.click(sender: self.button)
        
        var b = (self.currentTitle as NSString).doubleValue
        if self.currentTitle.contains("折")
        {
            b = b / 10.0
        }
        if b > 0.001
        {
            self.callBack(b)
        }else
        {
            self.callBack(1.0)
        }
        
    }

 
    
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.titleArray.count
    }
    
    
    
    
    // returns width of column and height of row for each component.
    @available(iOS 2.0, *)
     public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        return DeviceW
    }
    
    @available(iOS 2.0, *)
     public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 40.0
    }
    
    // these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
    // for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
    // If you return back a different object, the old one will be released. the view will be centered in the row rect
    @available(iOS 2.0, *)
     public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
            return self.titleArray[row]
        }
        return ""
    }
    
    
    
    @available(iOS 2.0, *)
     public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            self.currentTitle = titleArray[row]
        }
        
    }

    
    
    
}
