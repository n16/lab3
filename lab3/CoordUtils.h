//
//  CoordUtils.h
//  lab3
//
//  Created by Ernst Haagsman on 11/11/15.
//  Copyright © 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CoordUtils : NSObject

+ (float) metersBetween: (CLLocationCoordinate2D)here :(CLLocationCoordinate2D) andThere;
+ (float) bearingBetween: (CLLocationCoordinate2D)here :(CLLocationCoordinate2D) andThere;

@end
