//
//  DetailsViewController.m
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize buildingImageName;
@synthesize locationManager;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (locationManager == nil){
        locationManager = [[CLLocationManager alloc] init];
    }
    
    // Start location manager to query walking distance when we get a fix
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    locationManager.delegate = self;
    
    // Ensure we don't get too many updates to prevent overloading google
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.distanceFilter = 50;
}

- (void) viewWillAppear:(BOOL)animated
{
    [locationManager startUpdatingLocation];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBuilding:(LABBuilding *)building
{
    self.nameLabel.text = building.buildingName;
    self.addressLabel.text = building.buildingAddress;
    [self.addressLabel sizeToFit];
    self.distanceLabel.text = @"Loading";
    [self.buildingImageName setImage: [UIImage imageNamed: building.imageName]];
}

#pragma mark Location Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *loc = locations.lastObject;
}



@end
