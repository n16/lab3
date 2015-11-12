//
//  ViewController.m
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "TableViewController.h"
#import "LABBuilding.h"
#import "Constants.h"
#import "BuildingHighlight.h"
#import "CoordUtils.h"

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface ViewController (){
NSMutableArray *buildings;
    NSUserDefaults *defaults;
    BuildingHighlight *highlight;
}

@end

@implementation ViewController

@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    buildings = [[NSMutableArray alloc] initWithCapacity: 6];
    defaults = [NSUserDefaults standardUserDefaults];
    
    // Define buildings
    
    LABBuilding *library = [[LABBuilding alloc] init];
    library.latlon = [[CLLocation alloc] initWithLatitude: 37.335571 longitude: -121.884661];
    library.buildingName = @"Dr. Martin Luther King, Jr. Library";
    library.buildingAddress = @"150 E San Fernando Street, San Jose, CA 95112";
    library.imageName = @"library.png";
    library.locationOnImage = CGRectMake(55,190,78,92);
    [buildings addObject: library];
    
    LABBuilding *engr = [[LABBuilding alloc] init];
    engr.latlon = [[CLLocation alloc] initWithLatitude: 37.337123 longitude: -121.881764];
    engr.buildingName = @"Charles W. Davidson College of Engineering";
    engr.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    engr.imageName = @"engineering.png";
    engr.locationOnImage = CGRectMake(340,195,95,100);
    [buildings addObject: engr];
    
    LABBuilding *su = [[LABBuilding alloc] init];
    su.latlon = [[CLLocation alloc] initWithLatitude: 37.336326 longitude: -121.881342];
    su.buildingName = @"Student Union Building";
    su.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    su.imageName = @"student-union.png";
    su.locationOnImage = CGRectMake(330, 304, 186, 54);
    [buildings addObject: su];
    
    LABBuilding *yuh = [[LABBuilding alloc] init];
    yuh.latlon = [[CLLocation alloc] initWithLatitude: 37.333682 longitude: -121.883865];
    yuh.buildingName = @"Yoshihiro Uchida Hall";
    yuh.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    yuh.imageName = @"yuh.png";
    yuh.locationOnImage = CGRectMake(55, 402, 78, 73);
    [buildings addObject: yuh];
    
    LABBuilding *bbc = [[LABBuilding alloc] init];
    bbc.latlon = [[CLLocation alloc] initWithLatitude: 37.337079 longitude: -121.878867];
    bbc.buildingName = @"Boccardo Business Complex";
    bbc.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    bbc.imageName = @"bbc.png";
    bbc.locationOnImage = CGRectMake(524, 353, 69, 56);
    [buildings addObject: bbc];
    
    LABBuilding *spg = [[LABBuilding alloc] init];
    spg.latlon = [[CLLocation alloc] initWithLatitude: 37.333110 longitude: -121.880796];
    spg.buildingName = @"South Parking Garage";
    spg.buildingAddress = @"330 South 7th Street, San Jose, CA 95112";
    spg.imageName = @"spg.png";
    spg.locationOnImage = CGRectMake(194, 558, 126, 93);
    [buildings addObject: spg];
    
    // End of defining buildings
    
    // Retrieve persisted ScrollView state
    CGPoint offset = CGPointMake([defaults floatForKey:XPosPreferencesKey], [defaults floatForKey:YPosPreferencesKey]);
    
    // If it wasn't set prior, floatForKey returns 0.0
    float zoom = [defaults floatForKey:ZoomPreferencesKey];
    if (zoom < self.scrollView.minimumZoomScale){
        // 0.6 zoom ensures full map visible on iPhone 6 screen
        zoom = 0.6f;
    }

    [self.scrollView setZoomScale: zoom];
    self.scrollView.contentSize = CGSizeMake(self.imageView.image.size.width * zoom, self.imageView.image.size.height * zoom);
    
    [self.scrollView setContentOffset:offset];
    
    // Set up tap recognizer
    UITapGestureRecognizer *scrollTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleScrollTap:)];
    [self.scrollView addGestureRecognizer:scrollTap];
    
    // Start listening for location
    if (locationManager == nil){
        locationManager = [[CLLocationManager alloc] init];
    }
    
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 5;

}

- (void) viewWillAppear:(BOOL)animated
{
    [locationManager startUpdatingLocation];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [locationManager stopUpdatingLocation];
}

- (void)handleScrollTap:(UITapGestureRecognizer *)recognizer {
    // Get the touched point on the imageview (scaling handled by the locationInView method)
    CGPoint touchedPoint = [recognizer locationInView: self.imageView];
    
    // Iterate through the buildings array, if one of them matches, launch the detail view
    for (LABBuilding *building in buildings){
        if(CGRectContainsPoint(building.locationOnImage, touchedPoint)){
            DetailsViewController *DVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
            
            [self presentViewController:DVC animated:YES completion:nil];
            
            [DVC setBuilding: building];
            
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [self removeHighlight];
    self.scrollView.contentSize = CGSizeMake(self.imageView.image.size.width * scale, self.imageView.image.size.height * scale);
    [defaults setFloat: scale forKey: ZoomPreferencesKey];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    [self removeHighlight];
    [defaults setFloat: self.scrollView.contentOffset.x forKey: XPosPreferencesKey];
    [defaults setFloat: self.scrollView.contentOffset.y forKey: YPosPreferencesKey];
}

- (IBAction)startSearch:(id)sender{
    // Remove the highlight to prevent multiple highlights from being made
    [self removeHighlight];
    
    // Go to search
    TableViewController *TVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    [TVC setBuildings:buildings];
    TVC.delegate = self;
    [self presentViewController:TVC animated:YES completion:nil];
}

- (void) goToBuilding:(LABBuilding *)building
{
    // Zoom to 100%
    [self.scrollView setZoomScale:1.0f];
    
    // Center building in the scrollview
    CGFloat offsetX = building.locationOnImage.origin.x + (building.locationOnImage.size.width / 2) - (self.scrollView.bounds.size.width / 2);
    CGFloat offsetY = building.locationOnImage.origin.y + (building.locationOnImage.size.height / 2) - (self.scrollView.bounds.size.height / 2);
    
    [self.scrollView setContentOffset:CGPointMake(offsetX, offsetY)];

    // Update scrollView's contentsize to enable scrolling
    // No need to adjust for scale because we just zoomed the view to 100%
    self.scrollView.contentSize = CGSizeMake(self.imageView.image.size.width, self.imageView.image.size.height);
    
    // Draw highlight
    highlight = [[BuildingHighlight alloc] initWithFrame:building.locationOnImage];
    [self.scrollView addSubview:highlight];
}

-(void) removeHighlight
{
    [highlight removeFromSuperview];
}

#pragma mark LocationManager delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocationCoordinate2D coord = locations.lastObject.coordinate;
    
    // Taking king library as a known point on the map, let's see where the user is in relation to the library
    CLLocationCoordinate2D library = CLLocationCoordinate2DMake(37.335571, -121.884661);
    
    float distance = [CoordUtils metersBetween:library :coord];
    float bearing = [CoordUtils bearingBetween:library :coord];
    
    // The map's scale is approximately 419 pixels / 464 meters
    float distance_map = distance * (419.0/464.0);
    
    // Up in our map is 31 deg West, so we need to adjust our bearing by 31 degrees
    float bearing_map = bearing + 31;
    
    // Now we just need some trigonometrics to calculate if and where to draw the circle
    float xPos = distance_map * sin(degreesToRadians(bearing_map));
    float yPos = -(distance_map * cos(degreesToRadians(bearing_map)));
}

@end
