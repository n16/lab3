//
//  ViewController.m
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "LABBuilding.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate> {
NSMutableArray *buildings;
CLLocationManager *locationManager;
CLGeocoder *geocoder;
CLPlacemark *placemark;
}

@end

@implementation ViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    buildings = [[NSMutableArray alloc] initWithCapacity: 6];
    
    // Define buildings
    
    LABBuilding *library = [[LABBuilding alloc] init];
    library.buildingName = @"Dr. Martin Luther King, Jr. Library";
    library.buildingAddress = @"150 East San Fernando Street, San Jose, CA 95112";
    library.imageName = @"MLKLibrary.png";
    library.locationOnImage = CGRectMake(55,190,78,92);
    [buildings addObject: library];
    
    LABBuilding *engr = [[LABBuilding alloc] init];
    engr.buildingName = @"Charles W. Davidson College of Engineering";
    engr.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    engr.imageName = @"SJSU_Engineering.png";
    engr.locationOnImage = CGRectMake(340,195,95,100);
    [buildings addObject: engr];
    
    LABBuilding *su = [[LABBuilding alloc] init];
    su.buildingName = @"Student Union Building";
    su.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    su.locationOnImage = CGRectMake(330, 304, 186, 54);
    [buildings addObject: su];
    
    LABBuilding *yuh = [[LABBuilding alloc] init];
    yuh.buildingName = @"Yoshihiro Uchida Hall";
    yuh.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    yuh.locationOnImage = CGRectMake(55, 402, 78, 73);
    [buildings addObject: yuh];
    
    LABBuilding *bbc = [[LABBuilding alloc] init];
    bbc.buildingName = @"Boccardo Business Complex";
    bbc.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    bbc.locationOnImage = CGRectMake(524, 353, 69, 56);
    [buildings addObject: bbc];
    
    LABBuilding *spg = [[LABBuilding alloc] init];
    spg.buildingName = @"South Parking Garage";
    spg.buildingAddress = @"330 South 7th Street, San Jose, CA 95112";
    spg.locationOnImage = CGRectMake(194, 558, 126, 93);
    [buildings addObject: spg];
    
    // End of defining buildings
    
    [self.imageView setImage:[UIImage imageNamed:@"campusmap.png"]];
    
    [self.scrollView setMaximumZoomScale:5.0f];
    [self.scrollView setClipsToBounds:YES];
    
    
    //location initialization
    locationManager = [[CLLocationManager alloc] init]; //for latitude/lognitude
    geocoder = [[CLGeocoder alloc] init]; //for actual address
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        _testLabelLongitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _testLabelLatitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    //get the actual address
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.testLabelAddress.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        }
        else {
            NSLog(@"%@", error.debugDescription);
        }
    }];
    
    
    
    
}

///////////

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (IBAction)ENGRButton:(id)sender {
    DetailsViewController *DVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    
    [self presentViewController:DVC animated:YES completion:nil];
    
    [DVC setBuilding: [buildings objectAtIndex: 1]];
    
}

- (IBAction)MLKButton:(id)sender {
    DetailsViewController *DVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [self presentViewController:DVC animated:YES completion:nil];
    
    [DVC setBuilding: [buildings objectAtIndex: 0]];
}

- (IBAction)ENGRTab:(id)sender {
}



//get the current location
- (IBAction)getCurrentLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if([CLLocationManager locationServicesEnabled])
        [locationManager startUpdatingLocation];
}

@end
