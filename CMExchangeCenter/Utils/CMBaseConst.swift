//
//  CMBaseConst.swift
//  CMExchangeCenter
//
//  Created by wangze on 2018/4/11.
//  Copyright © 2018年 wangze. All rights reserved.
//

import Foundation
import UIKit

let kScreenW :Double = Double(UIScreen.main.bounds.size.width)
let kScreenH :Double = Double(UIScreen.main.bounds.size.height)
let kScreen :CGRect = UIScreen.main.bounds
let kNaviBarH :Double = kScreenH == 812.0 ? 88.0:64.0
let kTabBarH :Double = kScreenH == 812 ? 83.0:49.0
let kQuotationBtnH :Double = 40.0

//Network Urls
let kRequestUrl :String = "http://ibitline.com/"
//获取新闻列表的Url
let kNewsListUrl :String = kRequestUrl + "coin-info/api/v1/news/list"



