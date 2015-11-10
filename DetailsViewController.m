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
    self.distanceLabel.text = @"Walking Distance: N/A";
    [self.buildingImageName setImage: [UIImage imageNamed: building.imageName]];
}



@end
