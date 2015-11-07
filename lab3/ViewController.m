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

@interface ViewController (){
NSMutableArray *buildings;
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
    [buildings addObject: library];
    
    
    LABBuilding *engr = [[LABBuilding alloc] init];
    engr.buildingName = @"Charles W. Davidson College of Engineering";
    engr.buildingAddress = @"1 Washington Square, San Jose, CA 95112";
    engr.imageName = @"SJSU_Engineering.png";
    [buildings addObject: engr];
    
    
    // End of defining buildings
    
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

@end
