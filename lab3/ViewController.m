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
int xCoordinate;
int yCoordinate;
int x;
int y;

    
}

@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    xCoordinate = 10;
    yCoordinate = 10;
    
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

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    }
#endif
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    
    // create a red circle
    [self.reddot setImage:[UIImage imageNamed:@"reddot.png"]];
    
    //self.reddot.center = self.view.center;
    //[self.view addSubview:self.reddot];
    
    //update x and y based on the current location coordinates + based on zoom-level
//    self.reddot.frame = CGRectMake(self.reddot.frame.origin.x, self.reddot.frame.origin.y, xCoordinate, yCoordinate);
//    self.reddot.frame = CGRectMake(self.reddot.frame.size.width, self.reddot.frame.size.height, 10, 10);
    self.reddot.clipsToBounds = YES;
    
    
    int xTopLeft = 20;
    int yTopLeft = 143;
    int xBottomRight = 270;
    int yBottomRight = 453;
    int imageWidth = 320;
    int longitude = -121.880796;
    int lattitude = 37.333110;
    
    float LATITUDE = 37.335571;
    float LONGITUDE = -121.884661;
    
    //Top left corner: 37.338800, -121.886478
    //Bottom right corner: 37.331361, -121.876243
    x = 2.9 * (xTopLeft + (xTopLeft * lattitude / LATITUDE));
    y = 1.5 * (yTopLeft + (yTopLeft * longitude / LONGITUDE));
    
    //TODO get current zoom
    int scale = self.scrollView.frame.size.width / 320;
    imageView.frame = CGRectMake(_scrollView.frame.origin.x, _scrollView.frame.origin.y,
                                 320*scale, 504*scale);
    
    //self.reddot.frame = CGRectMake(self.reddot.frame.origin.x, self.reddot.frame.origin.y, x, y);
    _testLabelLatitude.text = [NSString stringWithFormat:@"%d",x];
    _testLabelLongitude.text = [NSString stringWithFormat:@"%d",y];
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
#else
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
#endif
{
    CLLocation *currentLocation = locations.lastObject;
    
    if (currentLocation != nil) {
        _testLabelLongitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _testLabelLatitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        //TODO remove these 2 following lines
        _testLabelLatitude.text = [NSString stringWithFormat:@"%d",x];
        _testLabelLongitude.text = [NSString stringWithFormat:@"%d",y];
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
