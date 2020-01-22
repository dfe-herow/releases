//
//  AsyncNotificationTask.swift
//  Complete
//
//  Created by Connecthings on 27/10/2017.
//  Copyright © 2017 R&D connecthings. All rights reserved.
//

import Foundation
import PromiseKit
import ConnectPlaceActions
import HerowConnection
import HerowLocationDetection

public class AsyncNotificationTask: NSObject, HerowNotificationTaskDelegate {
    public func launchNotificationTask(placeNotification: HerowPlaceNotification, displayPlaceNotificationDelegate: DisplayPlaceNotificationDelegate) {
        displayPlaceNotificationDelegate.displayPlaceNotification(PlaceNotificationImage(placeNotification: placeNotification))
    }
}
