//
//  CHDViewController.swift
//  mortgageCalculator
//
//  Created by 崔海达 on 2017/2/5.
//  Copyright © 2017年 崔海达. All rights reserved.
//

import UIKit

class CHDViewController: UIViewController {
    var segment:UISegmentedControl?
    var tableView:UITableView?
    var tableViewframe:CGRect!
    let cell = Bundle.main.loadNibNamed("CHDTableViewCell", owner: self, options: nil)?[0] as! CHDTableViewCell
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "房贷计算器"        

        let item = UIBarButtonItem(title: "关于", style: .done, target: self, action:#selector(self.about))
        
        self.navigationItem.rightBarButtonItem = item
        
        let leftItem = UIBarButtonItem(title: "分享", style: .done, target: self, action: #selector(self.shareClick))
        self.navigationItem.leftBarButtonItem = leftItem
        
    }
    
    func about()
    {
        let vc = CHDAboutViewController(nibName: "CHDAboutViewController", bundle: Bundle.main)
        vc.title = "关于"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func shareClick()
    {
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "分享内容",
                                          images : UIImage(named: "1.png"),
                                          url : NSURL(string:"https://itunes.apple.com/cn/app/%E6%9C%88%E4%BE%9B%E8%AE%A1%E7%AE%97%E5%99%A8/id1203623034?mt=8") as URL!,
                                          title : "分享标题",
                                          type : SSDKContentType.image)
        
        //2.进行分享
        ShareSDK.share(SSDKPlatformType.subTypeWechatSession, parameters: shareParames) { (state : SSDKResponseState, nil, entity : SSDKContentEntity?, error :Error?) in
            
            switch state{
                
            case SSDKResponseState.success: print("分享成功")
            case SSDKResponseState.fail:    print("授权失败,错误描述:\(error)")
            case SSDKResponseState.cancel:  print("操作取消")
                
            default:
                break
            }
            
        }
    }
    
    override func viewWillLayoutSubviews() {
        if self.segment != nil
        {
            self.segment?.removeFromSuperview()
        }
        if self.tableView != nil
        {
            self.tableView?.removeFromSuperview()
        }
        let segment = UISegmentedControl(items: ["商业贷款","公积金贷款"])//,"组合贷款" 
        self.segment = segment
        segment.addTarget(self, action: #selector(self.segmentAction(segment:)), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        segment.tintColor = UIColor(red: 72/255.0, green: 192/255.0, blue: 1.0, alpha: 1.0)
        segment.center = CGPoint(x: self.view.center.x, y: 20)
        self.view.addSubview(segment)
        
        
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.frame = CGRect(x: 0, y: 39, width: self.view.frame.size.width, height: 3660)
        self.tableView = tableView
        self.tableViewframe = tableView.frame
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        if UIApplication.shared.statusBarOrientation == .portrait
        {
            tableView.isScrollEnabled = true
        }else
        {
            tableView.isScrollEnabled = true

        }
       // tableView.backgroundColor = .green
        self.view.addSubview(tableView)


    }
    
    func segmentAction(segment:UISegmentedControl)
    {
        if segment.selectedSegmentIndex == 0
        {
            print("商业贷款")
            self.cell.callBack(segment.selectedSegmentIndex)
        }else if segment.selectedSegmentIndex == 1
        {
            print("公积金贷款")
            self.cell.callBack(segment.selectedSegmentIndex)

        }else if segment.selectedSegmentIndex == 2{
            print("组合贷款")
            self.cell.callBack(segment.selectedSegmentIndex)

        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension CHDViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 366
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          if UIApplication.shared.statusBarOrientation == .portrait
          {
            return 0.01

        }else
          {
            return 70

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView?.endEditing(true)
    }
    
}

