//
//  CMQuotationViewController.swift
//  CMExchangeCenter
//
//  Created by wangze on 2018/4/11.
//  Copyright © 2018年 wangze. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftProgressHUD

class CMQuotationViewController: UIViewController, UIScrollViewDelegate{
    
    var selectedBtn :UIButton?
    
    var quotationScrollV :UIScrollView?
    
//    var request: Alamofire.Request? {
//        didSet {
//            oldValue?.cancel()
//            
//            title = request?.description
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        buildUI()
        buildData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - buildData
    func buildData() {
        requestNewsNetService()
    }
    
    func requestNewsNetService() -> Void {
        
        
        SwiftProgressHUD.showWait()
//        showAnimationImages([UIImage(named: "estateTabIcon")!], timeMilliseconds: Int(1.0))
        Alamofire.request(kNewsListUrl, method: HTTPMethod.get, parameters: ["request_lan":"en_US", "action":"0", "news_num":10, "news_id":"0"])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
                SwiftProgressHUD.hideAllHUD()
                switch response.result{
                case .success(let data):
                    debugPrint(response.result)
                    let newsItem :CMNewsItem? = Mapper<CMNewsItem>().map(JSONObject: data)
                    //无论是装包还是类型推断，隐式装包还是显式装包，Swift语言的变量值(一般为对象类型)必须不为nil，枚举类型的变量值除外.
                    
                    //装包后的变量可以进行nil判断
//                    guard newsItem != nil else{
//                        return
//                    }
//                    debugPrint(newsItem!)
                    //装包后的对象可以进行非nil判断
                    if newsItem != nil {
                        debugPrint(newsItem!)
                    }
                case .failure(let error):
                    debugPrint(error)
                }
        }
    }
    
    
    // MARK: - buildUI
    func buildUI() {
        
        setupBtns()
        setupQuotationScrollV()
    }
    
    func setupQuotationScrollV() {
        
        quotationScrollV = UIScrollView(frame:CGRect(x: 0.0, y: kNaviBarH+kQuotationBtnH, width: kScreenW, height: kScreenH - kNaviBarH - kTabBarH - kQuotationBtnH))
        view.addSubview(quotationScrollV!)
        quotationScrollV?.backgroundColor = UIColor.cyan
        quotationScrollV?.delegate = self
        //强制类型转换之前需要进行解包操作.
        debugPrint(Double(quotationScrollV!.frame.width))
        quotationScrollV?.contentSize = CGSize(width: Double((quotationScrollV!.frame.width))*Double(4), height: Double(quotationScrollV!.frame.height))
        quotationScrollV?.isPagingEnabled = true
    }
    
    func setupBtns() {
        
        for item in 0...3 {
            let btn :UIButton = UIButton(type: UIButtonType.custom)
            btn.frame = CGRect(x: 0.0 + Double(item)*(Double(kScreenW/4)), y: kNaviBarH, width: Double(kScreenW/4), height: kQuotationBtnH)
            btn.tag = item
            btn.addTarget(self, action: #selector(self.didPressedCoinBtn(_:)), for: UIControlEvents.touchUpInside)
            btn.backgroundColor = UIColor.orange
            btn.setTitle(String(item), for: UIControlState.normal)
            view.addSubview(btn)
            if item == 0 {self.selectedBtn = btn}
        }
    }
    
    @objc func didPressedCoinBtn(_ btn: UIButton) {
        
        selectedBtn?.backgroundColor = UIColor.orange
        btn.backgroundColor = UIColor.yellow
        selectedBtn = btn
    }
    
    //    MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
