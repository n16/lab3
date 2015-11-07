//
//  LABBuilding.h
//  lab3
//
//  Created by Student on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface LABBuilding : NSObject

@property (nonatomic) CGRect locationOnImage;
@property (nonatomic) NSString *buildingName;
@property (nonatomic) NSString *buildingAddress;
@property (nonatomic) NSString *imageName;
@property (nonatomic) CLLocation *latlon;

@end