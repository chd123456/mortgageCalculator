//
//  CHDNavigationController.swift
//  MobileReceipt
//
//  Created by 崔海达 on 16/2/25.
//  Copyright © 2016年 com.yonyou.nc. All rights reserved.
//

import UIKit
var navBarH:Double = 0.0
class CHDNavigationController: UINavigationController {
    /**
     当第一次使用这个类的时候会调用一次
     */
    override class func initialize()
    {
        let navbarTitleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        let bar = UINavigationBar.appearance()
        bar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), for: .default)
        
        bar.titleTextAttributes = navbarTitleTextAttributes
        bar.tintColor = UIColor.white
    }

//
   required override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func back()
    {
        self.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIView{
    func showMessage(message:NSString,animateDuration:Double)
    {
        let window = UIApplication.shared.keyWindow
        let showView = UIView()
        showView.backgroundColor = UIColor.black
        showView.frame = CGRect(x: 1, y: 1, width: 1, height: 1)//CGRectMake(1, 1, 1, 1);
        showView.alpha = 1.0;
        showView.layer.cornerRadius = 5.0;
        showView.layer.masksToBounds = true;
        window?.addSubview(showView)
        
        let label = UILabel()
        let attributesArray = [NSFontAttributeName:UIFont.systemFont(ofSize: 17),NSForegroundColorAttributeName:UIColor.lightGray]
        let labelSize:CGSize = message.size(attributes: attributesArray)
        
        label.frame = CGRect(x: 10.0, y: 5.0, width: labelSize.width, height: labelSize.height)//CGRectMake(10.0, 5.0, labelSize.width,labelSize.height);
        label.numberOfLines = 0
        label.text = message as String;
        label.textColor = UIColor.white;
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        label.backgroundColor = UIColor.clear;
        label.font = UIFont.boldSystemFont(ofSize: 15)
        showView.addSubview(label)
        showView.frame = CGRect(x: (UIScreen.main.bounds.width - labelSize.width - 20.0)/2.0, y: UIScreen.main.bounds.width - 200.0, width:  labelSize.width+20.0, height: labelSize.height+10.0)
        
        //CGRectMake((UIScreen.main.bounds.width - labelSize.width - 20.0)/2.0,  UIScreen.main.bounds.width - 200.0, labelSize.width+20.0, labelSize.height+10.0)
        
        UIView.animate(withDuration: animateDuration, animations: { () -> Void in
            showView.alpha = 0
        }) { (finished) -> Void in
            showView.removeFromSuperview()
        }
        
    }

}

