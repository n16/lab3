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



@end
