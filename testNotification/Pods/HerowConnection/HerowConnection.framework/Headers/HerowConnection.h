//
//  HerowConnection.h
//  HerowConnection
//
//  Created by Olivier Stevens on 24/08/2017.
//  Copyright © 2017 Connecthings. All rights reserved.
//

#import <UIKit/UIKit.h>
//! Project version number for HerowConnection.
FOUNDATION_EXPORT double HerowConnectionVersionNumber;

//! Project version string for HerowConnection.
FOUNDATION_EXPORT const unsigned char HerowConnectionVersionString[];

typedef NS_OPTIONS(NSUInteger, HerowPushOptions) {
    HerowPushOptionsBadge   = (1 << 0),
    HerowPushOptionsSound   = (1 << 1),
    HerowPushOptionsAlert   = (1 << 2)
};
// In this header, you should import all the public headers of your framework using statements like #import <HerowConnection/PublicHeader.h>


