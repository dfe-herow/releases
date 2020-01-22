//
//  AppDelegate.swift
//  Complete
//
//  Created by Connecthings on 26/01/2017.
//  Copyright © 2017 R&D connecthings. All rights reserved.
//

import UIKit
import ConnectPlaceActions
import HerowConnection
import HerowLocationDetection
import UserNotifications
import ConnectPlaceCommon
@UIApplicationMain

class AppDelegate: NSObject, UIApplicationDelegate, HerowReceiveNotificationContentDelegate {
    private let notificationIdentifier: String = "INVITE_CATEGORY"
    var window: UIWindow?
    var herowInitializer: HerowInitializer?
    var herowdetectionManager: HerowDetectionManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        herowInitializer = HerowInitializer.shared
        herowInitializer?.configPlatform(Platform.preProd)
                         .configApp(identifier: "your id", sdkKey: "your sdk key")
                         .synchronize()


        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            //The request can be done as well in a viewController which allows to display a message if the user refuse to receive notifications
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                if (error == nil) {
                    NSLog("request authorization succeeded!");
                }
            }
        } else if(UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:)))){
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings (types: [.alert, .sound], categories: nil))
        }

        return true
    }

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        herowdetectionManager?.didReceivePlaceNotification(notification.userInfo)
    }

    func didReceivePlaceNotification(_ placeNotification: HerowPlaceNotification) {
        NSLog("open a controller with a place notification")
        //Quick way to notify controller
        let placeContentUserInfo:[String: PlaceNotification] = ["placeNotification": placeNotification]
        NotificationCenter.default.post(name: NSNotification.Name("placeNotification"), object:nil, userInfo: placeContentUserInfo)
    }
}
