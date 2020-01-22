//
//  AppDelegate.swift
//  testNotifications
//
//  Created by Damien on 17/01/2020.
//  Copyright © 2020 Connecthings. All rights reserved.
//

import UIKit
import HerowConnection;
import ConnectPlaceCommon;
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let herowInitializer =  HerowInitializer.shared
        herowInitializer.configPlatform(Platform.prod).configApp(identifier: "mobilise", sdkKey: "9GZL4luvP4klY4uFB103").synchronize()
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                if (error == nil) {
                    NSLog("request authorization succeeded!");
                }
            }
        } else if(UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:)))){
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings (types: [.alert, .sound], categories: nil))
        }
        GlobalLogger.shared.startDebug()
        return true
    }

   




}

