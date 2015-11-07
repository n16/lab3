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

//@synthesize myWebView;
//@synthesize nameValue;

//@synthesize nameFeeder;
//@synthesize nameLabel;
@synthesize buildingImageName;



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
    
//    [myWebView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:nameValue]]];
    
    //load the correct building image based on the buildingImageName
    //[self.imageView setImage:[UIImage imageNamed:buildingImageName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBuilding:(LABBuilding *)building
{
    self.nameLabel.text = [NSString stringWithFormat: @"Building name: %@", building.buildingName];
    self.addressLabel.text = [NSString stringWithFormat: @"Address: %@", building.buildingAddress];
    self.distanceLabel.text = @"Walking Distance: N/A";
    [self.buildingImageName setImage: [UIImage imageNamed: building.imageName]];
}



@end
