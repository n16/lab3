//
//  DetailsViewController.h
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LABBuilding.h"
#import <CoreLocation/CoreLocation.h>

@interface DetailsViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *buildingImageName;

@property (strong, nonatomic) CLLocationManager *locationManager;

- (void) setBuilding: (LABBuilding *) building;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations;

@end
