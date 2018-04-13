//
//  CMNewsItem.swift
//  CMExchangeCenter
//
//  Created by wangze on 2018/4/12.
//  Copyright © 2018年 wangze. All rights reserved.
//

import UIKit
import ObjectMapper

class CMNewsItem: Mappable {
    
    var code :String?
    var data :DetailNewsList?
    var msg :String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        msg <- map["msg"]
    }
    
}

class DetailNewsList: Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        news_list <- map["news_list"]
    }
    
    var news_list:[DetailNewsItem]?
}

class DetailNewsItem: Mappable {
    
    var desc :String?
    var language :String?
    var newsType :Int?
    var news_date :CLongLong?
    var news_id :CLongLong?
    var picture :String?
    var publishTime :CLongLong?
    var publisher :String?
    var seedUrl :String?
    var source_url :String?
    var title :String?
    var updateTime :CLongLong?
    var view_num :String?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        desc <- map["description"]
        language <- map["language"]
        newsType <- map["newsType"]
        news_date <- map["news_date"]
        news_id <- map["news_id"]
        picture <- map["picture"]
        publishTime <- map["publishTime"]
        publisher <- map["publisher"]
        seedUrl <- map["seedUrl"]
        source_url <- map["source_url"]
        title <- map["title"]
        updateTime <- map["updateTime"]
        view_num <- map["view_num"]
    }
}
