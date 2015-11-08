//
//  ViewController.h
//  lab3
//
//  Created by Nergal Issaie on 11/6/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


//- (IBAction)ENGRButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)ENGRButton:(id)sender;
- (IBAction)MLKButton:(id)sender;

- (IBAction)ENGRTab:(id)sender;

//new values
@property (weak, nonatomic) IBOutlet UILabel *testLabelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *testLabelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *testLabelAddress;


@end
