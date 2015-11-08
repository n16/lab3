//
//  ViewController.h
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, CLLocationManagerDelegate>
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


//- (IBAction)ENGRButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)ENGRButton:(id)sender;
- (IBAction)MLKButton:(id)sender;

- (IBAction)ENGRTab:(id)sender;

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations;

//new values -- TODO these are just for testing -- to be removed at the end
@property (weak, nonatomic) IBOutlet UILabel *testLabelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *testLabelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *testLabelAddress;


@end
