//
//  MyNotificationFilter.swift
//  Complete
//
//  Created by Connecthings on 24/11/2017.
//  Copyright © 2017 R&D connecthings. All rights reserved.
//

import Foundation

//
//  MyNotificationFilter.swift
//  Complete
//
//  Created by Connecthings on 23/11/2017.
//  Copyright © 2017 R&D connecthings. All rights reserved.
//
import Foundation
import ConnectPlaceCommon
import ConnectPlaceActions

class MyNotificationFilter: BaseNotificationFilter {
    static let MIN_NEXT_TIME_NOTIFICATION: String = "com.notification.minNextTimeNotification"

    let minTimeBetweenNotification: Double
    var minNextTimeNotification: Double

    init(_ minTimeBetweenNotification: Double) {
        self.minTimeBetweenNotification = minTimeBetweenNotification
        self.minNextTimeNotification = 0
    }

    public override func getName() -> String {
        return "MyNotificationFilter"
    }

    public override func createNewNotification(placeNotification: PlaceNotification) -> Bool {
        return self.minNextTimeNotification < CACurrentMediaTime()
    }

    public override func deleteCurrentNotification(placeNotification: PlaceNotification?) -> Bool {
        return true
    }

    public override func onNotificationCreated(placeNotification: PlaceNotification, created: Bool) {

    }

    public override func onNotificationDeleted(placeNotification: PlaceNotification?, deleted: Bool) {
        if (deleted) {
            minNextTimeNotification = CACurrentMediaTime() + minTimeBetweenNotification;
        }
    }

    public override func onBackground() {

    }

    public override func onForeground() {

    }

    public override func save(holder: DataHolderUserDefaults) {
        holder.putDouble(key: MyNotificationFilter.MIN_NEXT_TIME_NOTIFICATION, value: minNextTimeNotification)
    }

    public override func load(holder: DataHolderUserDefaults) {
        minNextTimeNotification = holder.getDouble(key: MyNotificationFilter.MIN_NEXT_TIME_NOTIFICATION)
    }
}

