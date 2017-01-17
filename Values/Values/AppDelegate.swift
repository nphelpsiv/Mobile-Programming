//
//  AppDelegate.swift
//  Values
//
//  Created by u0669056 on 1/17/17.
//  Copyright © 2017 Neal Phelps u0669056. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Declare variables
    var window: UIWindow?
    let XLabel: UILabel = UILabel()
    let YLabel: UILabel = UILabel()
    let XSlider: UISlider = UISlider()
    let XLabelVal: UILabel = UILabel()
    let YSlider: UISlider = UISlider()
    let YLabelVal: UILabel = UILabel()
    let MultLabel: UILabel = UILabel()
    let AddLabel: UILabel = UILabel()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.rootViewController?.view.backgroundColor = UIColor.lightGray
        window?.makeKeyAndVisible()
        
        
        XLabel.text = "X"
        XLabel.frame = CGRect(x: 30.0, y: 152.0, width: 25.0, height: 25.0)
        window?.rootViewController?.view.addSubview(XLabel)
        
        
        YLabel.text = "Y"
        YLabel.frame = CGRect(x: 30.0, y: 198.0, width: 25.0, height: 25.0)
        window?.rootViewController?.view.addSubview(YLabel)
        
        
        
        XSlider.frame = CGRect(x: 50.0, y: 140.0, width: 188.0, height: 50.0)
        window?.rootViewController?.view.addSubview(XSlider)
        XSlider.addTarget(self, action: #selector(AppDelegate.xValueChanged), for: .valueChanged)
        
        
        XLabelVal.text = "0.0"
        XLabelVal.frame = CGRect(x: 250.0, y: 152.0, width: 75.0, height: 25.0)
        window?.rootViewController?.view.addSubview(XLabelVal)
        
        
        YSlider.frame = CGRect(x: 50.0, y: 190.0, width: 188.0, height: 50.0)
        window?.rootViewController?.view.addSubview(YSlider)
        YSlider.addTarget(self, action: #selector(AppDelegate.yValueChanged), for: .valueChanged)
        
        YLabelVal.text = "0.0"
        YLabelVal.frame = CGRect(x: 250.0, y: 198.0, width: 75.0, height: 25.0)
        window?.rootViewController?.view.addSubview(YLabelVal)
        
        
        MultLabel.text = "X*Y: 0.0"
        MultLabel.frame = CGRect(x: 120.0, y: 240.0, width: 200.0, height: 75.0)
        window?.rootViewController?.view.addSubview(MultLabel)
        
        
        AddLabel.text = "X+Y: 0.0"
        AddLabel.frame = CGRect(x: 120.0, y: 265.0, width: 200.0, height: 75.0)
        window?.rootViewController?.view.addSubview(AddLabel)
        
        
        return true
    }
    //when X slider value has changed this visually updates its value and the add and multiply labels
    func xValueChanged(){
        var multVal: Float = 0.0
        var addVal: Float = 0.0
        
        multVal = XSlider.value * YSlider.value
        addVal = XSlider.value + YSlider.value
    
        XLabelVal.text = String(format: "%.3f", XSlider.value)
        MultLabel.text = "X*Y: " +  String(format: "%.3f", multVal)
        AddLabel.text = "X+Y: " + String(format: "%.3f", addVal)
    }
    //when Y slider value has changed this visually updates its value and the add and multiply labels
    func yValueChanged(){
        var multVal: Float = 0.0
        var addVal: Float = 0.0
        
        multVal = XSlider.value * YSlider.value
        addVal = XSlider.value + YSlider.value
        
        YLabelVal.text = String(format: "%.3f", YSlider.value)
        MultLabel.text = "X*Y: " +  String(format: "%.3f", multVal)
        AddLabel.text = "X+Y: " + String(format: "%.3f", addVal)
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


}

