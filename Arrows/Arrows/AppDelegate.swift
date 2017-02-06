//
//  AppDelegate.swift
//  Arrows
//
//  Created by u0669056 on 1/23/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var _colorChooser: ColorChooserView? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        //let vectorView: VectorView = VectorView()
        //vectorView.frame = CGRect(x:10.0, y:20.0, width: 300.0, height: 300.0)
        //vectorView.backgroundColor = UIColor.lightGray
        //vectorView.vectors = [Vector(px: 100.0, py: 200.0), Vector(px: 150.0, py: 160.0)]
        //window?.rootViewController?.view.addSubview(VectorView())
        _colorChooser = ColorChooserView(frame: UIScreen.main.bounds)
        _colorChooser?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        window?.rootViewController?.view.addSubview(_colorChooser!)
        
        _colorChooser?.knobViewGreen?.addTarget(self, action: #selector(knobChanged), for: .valueChanged)
        _colorChooser?.knobViewBlue?.addTarget(self, action: #selector(knobChanged), for: .valueChanged)
        _colorChooser?.knobViewRed?.addTarget(self, action: #selector(knobChanged), for: .valueChanged)
        
        return true
    }
    func knobChanged(){
//        NSLog("Changed! to : \(_knobViewBlue!.angle)")
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

