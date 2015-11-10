//
//  ViewController.h
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, buildingSearchResult>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)handleScrollTap:(UITapGestureRecognizer *) recognizer;
- (IBAction)startSearch:(id)sender;

-(void)goToBuilding:(LABBuilding *)building;

@end
