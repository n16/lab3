//
//  ViewController.m
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.imageView setImage:[UIImage imageNamed:@"campusmap.png"]];
    
    [self.scrollView setMaximumZoomScale:5.0f];
    [self.scrollView setClipsToBounds:YES];
}

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
//    DVC.nameValue = @"http://www.google.com";
    [self presentViewController:DVC animated:YES completion:nil];
    
    DVC.nameLabel.text=@"Building Name: ENGR";
    DVC.addressLabel.text = @"Address: San José State University Charles W. Davidson College of Engineering, 1 Washington Square, San Jose, CA 95112";
    
    //call calculate distance function and print the returned value below
    //TODO calculateDistance here
    DVC.distanceLabel.text = @"Walking Distance: N/A";
    [DVC.buildingImageName setImage:[UIImage imageNamed:@"SJSU_Engineering.png"]];
    
    
}

- (IBAction)MLKButton:(id)sender {
    DetailsViewController *DVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [self presentViewController:DVC animated:YES completion:nil];
    
    DVC.nameLabel.text=@"Building Name: MLK Library";
    DVC.addressLabel.text = @"Address: Dr. Martin Luther King, Jr. Library, 150 East San Fernando Street, San Jose, CA 95112";
    
    //call calculate distance function and print the returned value below
    //TODO calculateDistance here
    DVC.distanceLabel.text = @"Walking Distance: N/A";
    [DVC.buildingImageName setImage:[UIImage imageNamed:@"MLKLibrary.png"]];
}

- (IBAction)ENGRTab:(id)sender {
}

@end
