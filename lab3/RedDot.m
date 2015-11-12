//
//  RedDot.m
//  lab3
//
//  Created by Ernst Haagsman on 11/11/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "RedDot.h"

@implementation RedDot

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
    CGContextSetFillColor(context, CGColorGetComponents([[UIColor redColor] CGColor]));
    CGContextAddEllipseInRect(context, self.bounds);
    CGContextFillPath(context);
}

@end
