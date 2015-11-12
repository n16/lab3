//
//  ViewController.h
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, buildingSearchResult, CLLocationManagerDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong,nonatomic) CLLocationManager *locationManager;

- (void)handleScrollTap:(UITapGestureRecognizer *) recognizer;
- (IBAction)startSearch:(id)sender;

-(void)goToBuilding:(LABBuilding *)building;

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations;

@end
