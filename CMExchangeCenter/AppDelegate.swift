//
//  AppDelegate.swift
//  CMExchangeCenter
//
//  Created by wangze on 2018/4/11.
//  Copyright © 2018年 wangze. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.buildUI()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func buildUI(){
        
        let tabbarVC :UITabBarController = UITabBarController()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.init(red: 201.0/255.0, green: 201.0/255.0, blue: 1.0/255.0, alpha: 1.0)], for: UIControlState.selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.init(red: 82.0/255.0, green: 70.0/255.0, blue: 103.0/255.0, alpha: 1.0)], for: UIControlState.normal)
        
        let quotationVC :CMQuotationViewController = CMQuotationViewController()
        quotationVC.title = "行情"
        quotationVC.tabBarItem.image = UIImage(named: "quotationUnTabIcon")
        quotationVC.tabBarItem.selectedImage = UIImage(named: "quotationTabIcon")
        let quotationNavi :UINavigationController = UINavigationController(rootViewController: quotationVC)
        
        
        let exchangeVC :CMExchangeViewController = CMExchangeViewController()
        exchangeVC.title = "交易"
        exchangeVC.tabBarItem.image = UIImage(named: "exchangeUnTabIcon")
        exchangeVC.tabBarItem.selectedImage = UIImage(named: "exchangeTabIcon")
        let exchangeNavi :UINavigationController = UINavigationController(rootViewController: exchangeVC)
        
        let estateVC :CMEstateViewController = CMEstateViewController()
        estateVC.title = "资产"
        estateVC.tabBarItem.image = UIImage(named: "estateUnTabIcon")
        estateVC.tabBarItem.selectedImage = UIImage(named: "estateTabIcon")
        let estateNavi :UINavigationController = UINavigationController(rootViewController: estateVC)
        
        let mineVC :CMMineViewController = CMMineViewController()
        mineVC.title = "我的"
        mineVC.tabBarItem.image = UIImage(named: "mineUnTabIcon")
        mineVC.tabBarItem.selectedImage = UIImage(named: "mineTabIcon")
        let mineNavi :UINavigationController = UINavigationController(rootViewController: mineVC)
        
        tabbarVC.viewControllers = [quotationNavi, exchangeNavi, estateNavi, mineNavi]
        
        window = UIWindow(frame: CGRect(x: 0.0, y: 0.0, width: kScreenW, height: kScreenH))
        
        window!.rootViewController = tabbarVC
        
        window!.makeKeyAndVisible()
    }
}

