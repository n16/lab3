//
//  DetailsViewController.m
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController (){
    LABBuilding* _building;
}

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
    self.distanceLabel.text = @"Waiting for position";
    [self.buildingImageName setImage: [UIImage imageNamed: building.imageName]];
    _building = building;
}

#pragma mark Location Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocationCoordinate2D loc = locations.lastObject.coordinate;
    CLLocationCoordinate2D dest = _building.latlon.coordinate;
    
    NSMutableString *URLstring = [[NSMutableString alloc] initWithCapacity:300];
    [URLstring appendString: @"https://maps.googleapis.com/maps/api/distancematrix/json?"];
    [URLstring appendString: [NSString stringWithFormat:@"origins=%f,%f&", loc.latitude, loc.longitude]];
    [URLstring appendString: [NSString stringWithFormat:@"destinations=%f,%f&", dest.latitude, dest.longitude]];
    [URLstring appendString: @"mode=walking&"];
    [URLstring appendString: @"key=AIzaSyDefwwfJrWKTXqbQog7DjsBVs8tFArHva4&"];
    
    NSURL *requestURL = [NSURL URLWithString: URLstring];
    NSURLRequest *request = [NSURLRequest requestWithURL: requestURL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:0
                                                                   error:NULL];
        
        // Get the important bits from the JSON structure returned by google
        @try {
            NSArray *rows = [json objectForKey:@"rows"];
            NSDictionary *row = [rows objectAtIndex:0];
            NSArray *elements = [row objectForKey:@"elements"];
            NSDictionary *results = [elements objectAtIndex:0];
            NSDictionary *distance = [results objectForKey:@"distance"];
            NSDictionary *duration = [results objectForKey:@"duration"];
        
            if (duration == nil || distance == nil){
                self.distanceLabel.text = @"Could not obtain distance";
                return;
            }
            
            self.distanceLabel.text = [NSString stringWithFormat: @"%@ / %@ walk", [distance objectForKey:@"text"], [duration objectForKey:@"text"]];
        }
        @catch (NSException *e){
            self.distanceLabel.text = @"Could not obtain distance";
        }
    }];
}



@end
