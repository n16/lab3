//
//  BuildingHighlight.m
//  lab3
//
//  Created by Ernst Haagsman on 11/9/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "BuildingHighlight.h"

@implementation BuildingHighlight

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = NO;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backgroundColor = [UIColor clearColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 0.8);
    CGContextSetLineWidth(context, 2.0);
    CGContextStrokeRect(context, CGRectInset(self.bounds, 2.0, 2.0));
}


@end
